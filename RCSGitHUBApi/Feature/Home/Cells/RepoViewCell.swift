//
//  RepoViewCell.swift
//  RCSGitHUBApi
//
//  Created by rogerio on 11/11/17.
//  Copyright © 2017 rogeriocs. All rights reserved.
//


import UIKit

class RepoViewCell: UITableViewCell, ReusableView  {
    
    // MARK: Properties
    
    lazy var name: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.primary
        return label
    }()
    
    lazy var type: UILabel = {
       let label = UILabel(frame: .zero)
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textColor = UIColor.basic
       return label
    }()
    
    lazy var stackData: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [name, type])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.spacing = MetricsViews.topAndBottomMargin/2.0
        stackView.axis = .vertical
        return stackView
    }()
    
    let avatar: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: Init
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stackData)
        contentView.addSubview(avatar)
               
       NSLayoutConstraint.activate([
           avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: MetricsViews.topAndBottomMargin),
           avatar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
           avatar.heightAnchor.constraint(equalTo: contentView.heightAnchor),
           avatar.heightAnchor.constraint(equalToConstant: 92),
           avatar.widthAnchor.constraint(equalToConstant: 93),
           avatar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
           stackData.topAnchor.constraint(equalTo: contentView.topAnchor, constant: MetricsViews.topAndBottomMargin),
           stackData.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: MetricsViews.leftAndRigthMargin),
           stackData.trailingAnchor.constraint(equalTo: avatar.leadingAnchor),
       ])
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    
    }
    
    
    // MARK: Methods
    
    func setup(showGitHubData:ShowGitHubData) {
               
        name.text = showGitHubData.ownerName
        type.text = showGitHubData.type
        avatar.image = nil
        avatar.download(image: showGitHubData.avatar)
    }
    
}
