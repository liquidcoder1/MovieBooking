//
//  ActorCell.swift
//  MovieBooking
//
//  Created by John K on 15/12/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import UIKit


class ActorCell: UICollectionViewCell {
    static let reuseId: String = "ActorCell"
    var actor: Actor?{
        didSet{
            if let actor = self.actor {
                imageView.image = UIImage(named: "\(actor.image).jpg")
                titleLabel.text = actor.name
            }
        }
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "adastra.jpg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10

        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ad Astra"
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2


        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    private func setupCell(){
        
        self.addSubview(self.imageView)
        self.addSubview(self.titleLabel)
        
                
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.heightAnchor.constraint(equalTo: self.widthAnchor,multiplier: (3/2)),
            
            titleLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}

