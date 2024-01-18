//
//  SandwichButton.swift
//  Kiosk
//
//  Created by woong on 1/17/24.
//

import UIKit

class SandwichButton: UICollectionViewCell {
    
    let sandwichButtonID: String = "SandwichButton"
    
    let thumbnailView = ThumbnailView()
    
//    var sandwichImage: UIImage = UIImage(named: "m01") {
//        
//    } ?? UIImage(named: "m01")!
    
    var sandwichTitle: String = "" {
        didSet {
//            sandwichLabel.text = sandwichTitle
            thumbnailView.title = sandwichTitle
        }
    }
    
    var sandwichEngTitle: String = "" {
        didSet {
//            sandwichEngLabel.text = sandwichEngTitle
            thumbnailView.subTitle = sandwichEngTitle
        }
    }
    
    var sandwichCalTitle: String = "" {
        didSet {
//            sandwichCalLabel.text = sandwichCalTitle
            thumbnailView.highlightTitle = sandwichCalTitle
        }
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        customAddSubView(thumbnailView)
        
        
        thumbnailView.titleLabel.adjustsFontSizeToFitWidth = true
        thumbnailView.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thumbnailView.titleLabel.leadingAnchor.constraint(equalTo: thumbnailView.leadingAnchor, constant: 15),
            thumbnailView.titleLabel.trailingAnchor.constraint(equalTo: thumbnailView.trailingAnchor, constant: -15)
        ])
        
        thumbnailView.constraintEdge(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
