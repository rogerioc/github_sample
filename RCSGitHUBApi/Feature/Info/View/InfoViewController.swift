//
//  InfoViewController.swift
//  RCSGitHUBApi
//
//  Created by rogerio on 11/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class InfoViewController: UIViewController {
    
    var viewModel: InfoViewModel?
    private var bag = DisposeBag()
    
    lazy var name: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.primary
        return label
    }()
    
    lazy var avatar: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var typeTextArea: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
        
    required init?(coder: NSCoder) {
           super.init(coder: coder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
       
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(name)
        view.addSubview(avatar)
        view.addSubview(typeTextArea)
        view.backgroundColor = .white
        
        title = NSLocalizedString("detail.title", comment: "")        
            
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatar.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20),
            avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatar.heightAnchor.constraint(equalToConstant: 100),
            avatar.widthAnchor.constraint(equalToConstant: 100),
            typeTextArea.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 10),
            typeTextArea.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            typeTextArea.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            typeTextArea.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10)
        ])
        
        viewModel?.showData.subscribe(onNext: { [weak self] showGitHubData in
                self?.name.text = showGitHubData.ownerName
                self?.typeTextArea.text = showGitHubData.type
                self?.avatar.download(image: showGitHubData.avatar)
            }).disposed(by: bag)
        
        viewModel?.start()
    }
    
    
}
