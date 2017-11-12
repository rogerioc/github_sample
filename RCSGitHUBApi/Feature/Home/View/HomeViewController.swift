//
//  HomeViewController.swift
//  RCSGitHUBApi
//
//  Created by Rogerio on 10/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    @IBOutlet weak var label: UILabel!
    var homeViewModel: HomeViewModelProtocol?
    //var refreshControl = UIRefreshControl()!
    var showGitHubDatas:[ShowGitHubData] = [] {
        didSet { tableView.reloadData() }
    }
    
    var load:Bool! {
        didSet{
            if(self.load) {
                self.loading.startAnimating()
            }else {
                self.refreshControl?.endRefreshing()
                self.loading.stopAnimating()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load = false
        tableView.register(RepoViewCell.self)
        self.refreshControl = UIRefreshControl()
        homeViewModel = HomeViewModel.init(gitHubApi: GitHubApiService())
        homeViewModel?.publicRepositoriesDelegate = self
        homeViewModel?.getRepositories()
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl!)
        }
        refreshControl!.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)

    }
    
    @objc private func refreshData(_ sender: Any) {
        self.showGitHubDatas.removeAll()
        homeViewModel?.getRepositories()
    }
    
}

extension HomeViewController: GetPublicRepositories {
    func repositoriesSuccess(data:[ShowGitHubData]) {
          self.showGitHubDatas.append(contentsOf: data)
        
    }
    func repositoriesError(_ error: Int) {
        self.showAlerError(title: Messages.ErrorTitle, message: Messages.InternalError)
    }
    func repositoriesIsLoading(_ loading: Bool) {
        load = loading
        
    }
    func repositoriesIsRefreshing(_ loading: Bool) {
        load = loading
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showGitHubDatas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : RepoViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setup(showGitHubData:showGitHubDatas[indexPath.row])
        if indexPath.row == showGitHubDatas.count-1 {
            homeViewModel?.getNextData()
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: InfoViewConstants.SegueIdentifiers.InfoView, sender: showGitHubDatas[indexPath.row])
    }
}


extension HomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier {
            switch identifier {
            case InfoViewConstants.SegueIdentifiers.InfoView:
                if let destinationController = segue.destination as? InfoViewController {
                    destinationController.showGitHubData = sender as? ShowGitHubData ?? ShowGitHubData()
                }
                
            default:
                self.showAlerError(title: Messages.ErrorTitle, message: Messages.InternalError)
            }
        }
    }
}
