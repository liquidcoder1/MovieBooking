//
//  TrendingCell.swift
//  MovieBooking
//
//  Created by John K on 21/12/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import UIKit
import KingfisherSwiftUI

class TrendingCell: UICollectionViewCell {
    static let reuseId: String = "TrendingCell"
     var movie: MovieViewModel?{
          didSet{
              if let movie = self.movie {
                  imageView.kf.setImage(with: movie.backdropUrl)
                  titleLabel.text = movie.title
              }
          }
      }
      
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "adastra_land.jpg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ad Astra"
        label.textColor = UIColor(named: "textColor")
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 20, weight: .bold))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = .white
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
          let gradientView = UIView(frame: CGRect(x: 0, y:  self.frame.height / 4 , width: self.frame.width, height: self.frame.height / 2) )
          gradientView.layer.cornerRadius = 20
          let gradient = CAGradientLayer()
          gradient.frame = gradientView.frame
          gradient.colors = [UIColor.clear, UIColor.black.cgColor]
          
          gradientView.layer.insertSublayer(gradient, at: 0)

          contentView.addSubview(self.imageView)
          self.imageView.addSubview(gradientView)
          contentView.addSubview(titleLabel)
              
          
          NSLayoutConstraint.activate([
              imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
              imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
              imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
              imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1),
              
              titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
              titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
              titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
              titleLabel.heightAnchor.constraint(equalToConstant: 50)
          ])

      }
    
}


