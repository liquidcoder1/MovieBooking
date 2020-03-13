//
//  HeaderView.swift
//  MovieBooking
//
//  Created by John K on 15/12/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    static let reuseId = "HeaderView"
    var onSeeAllClicked = {}
    
    lazy var name: UILabel = {
          let label = UILabel()
          label.text = "Popular"
          label.textColor = UIColor(named: "textColor")
          label.numberOfLines = 2
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 20, weight: .bold))

          return label
      }()
    
    lazy var seeAll: UIButton = {
        let button  = UIButton(type: .system)
        button.setTitle("See all", for: .normal)
        button.setTitleColor(UIColor(named: "darkPurple"), for: .normal)
        button.addTarget(self, action: #selector(seeAllMovies), for: .touchUpInside)
        button.backgroundColor = .clear
        return button
    }()
    
    
    lazy var HStack:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [name,seeAll])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(HStack)
        
        NSLayoutConstraint.activate([
            HStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            HStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            HStack.topAnchor.constraint(equalTo: self.topAnchor),
            HStack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
         fatalError("Not happening...")
    }
    
    @objc fileprivate func seeAllMovies(){
        self.onSeeAllClicked()
    }
}
