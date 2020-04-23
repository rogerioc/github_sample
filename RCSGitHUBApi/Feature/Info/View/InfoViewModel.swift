//
//  InfoViewModel.swift
//  RCSGitHUBApi
//
//  Created by rogerio on 11/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import Foundation
import RxSwift

struct InfoViewConstants {
    struct SegueIdentifiers {
        static let InfoView = "SegueInfoView"
    }
}

class InfoViewModel {
    
    private var showGitHubData: ShowGitHubData
    
    var showData = PublishSubject<ShowGitHubData>()
    
    init(showGitHubData: ShowGitHubData) {
        self.showGitHubData = showGitHubData
    }
    
    func start() {
        showData.onNext(self.showGitHubData)
    }
}
