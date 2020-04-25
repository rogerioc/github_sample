//
//  RepoCellViewModel.swift
//  RCSGitHUBApi
//
//  Created by rogerio on 23/04/20.
//  Copyright © 2020 rogeriocs. All rights reserved.
//

import Foundation
import RxSwift

class RepoCellViewModel {
    private var showGitHubData:ShowGitHubData
    
    var showData = PublishSubject<ShowGitHubData>()
    
    init(showGitHubData: ShowGitHubData) {
        self.showGitHubData = showGitHubData
    }
    
    func start() {
        showData.onNext(self.showGitHubData)
    }
}
