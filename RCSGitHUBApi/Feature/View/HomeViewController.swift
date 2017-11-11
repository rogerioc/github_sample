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
    var showGitHubDatas:[ShowGitHubData] = [] {
        didSet { tableView.reloadData() }
    }
    
    var load:Bool! {
        didSet{
            if(self.load) {
                self.loading.startAnimating()
            }else {
                self.loading.stopAnimating()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load = false
        tableView.register(RepoViewCell.self)
        homeViewModel = HomeViewModel.init(gitHubApi: GitHubApiService())
        homeViewModel?.publicRepositoriesDelegate = self
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
        let cell : RepoViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setup(showGitHubData:showGitHubDatas[indexPath.row])
//        if indexPath.row == repositories.count-1 && !isFinishLoad {
//            currentPage += 1
//            //fetchRepositories(query:RepositoryServiceLanguages.Java, page: currentPage)
//        }
        
        return cell
    }
}
