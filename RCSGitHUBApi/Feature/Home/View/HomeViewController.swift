//
//  HomeViewController.swift
//  RCSGitHUBApi
//
//  Created by Rogerio on 10/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    lazy var loading: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(frame: .zero)
        loading.translatesAutoresizingMaskIntoConstraints = false
        return loading
    }()
   
    let cellName = "repoCell"
    var homeViewModel: HomeViewModel?
    
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
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loading)
        load = false
        tableView.register(RepoViewCell.self, forCellReuseIdentifier: cellName)
        self.refreshControl = UIRefreshControl()
        homeViewModel?.publicRepositoriesDelegate = self
        homeViewModel?.getRepositories()
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl!)
        }
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        refreshControl!.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        
        NSLayoutConstraint.activate([
            loading.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loading.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        title = NSLocalizedString("home.title", comment: "")
    }
    
    @objc private func refreshData(_ sender: Any) {
        self.showGitHubDatas.removeAll()
        homeViewModel?.getRepositories()
    }
    
}

extension HomeViewController: GetPublicRepositories {
    func repositoriesSuccess(data:[ShowGitHubData]) {
          self.showGitHubDatas = data
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! RepoViewCell
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
        homeViewModel?.selected(atIndex: indexPath.row)
    }
}


extension HomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        if let identifier = segue.identifier {
//            switch identifier {
//            case InfoViewConstants.SegueIdentifiers.InfoView:
//                if let destinationController = segue.destination as? InfoViewController {
//                    destinationController.showGitHubData = sender as? ShowGitHubData ?? ShowGitHubData()
//                }
//                
//            default:
//                self.showAlerError(title: Messages.ErrorTitle, message: Messages.InternalError)
//            }
//        }
    }
}
