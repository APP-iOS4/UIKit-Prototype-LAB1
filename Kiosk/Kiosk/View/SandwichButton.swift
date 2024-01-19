//
//  SandwichButton.swift
//  Kiosk
//
//  Created by woong on 1/17/24.
//

import UIKit

class SandwichButton: UICollectionViewCell {
    
    static let sandwichButtonID: String = "SandwichButton"
    
    let thumbnailView = ThumbnailView()
    
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
    
    var isSelect: Bool = false {
        didSet {
            thumbnailView.isSelect = isSelect
        }
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        customAddSubView(thumbnailView)
        
        
        thumbnailView.titleLabel.adjustsFontSizeToFitWidth = true
        thumbnailView.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        thumbnailView.constraintEdge(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
