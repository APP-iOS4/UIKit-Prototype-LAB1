//
//  SauceCell.swift
//  Kiosk
//
//  Created by Woo Sung jong on 1/19/24.
//

import UIKit

class SauceCell: UICollectionViewCell {
    
    static let identifier: String = "sauceCell"
    
    let thumbnailView = ThumbnailView()
    
    var sauceTitle: String = "" {
        didSet {
            thumbnailView.title = sauceTitle
        }
    }
    
    var sauceEngTitle: String = "" {
        didSet {
            thumbnailView.subTitle = sauceEngTitle
        }
    }
    
    var sauceCalTitle: String = "" {
        didSet {
            thumbnailView.highlightTitle = sauceCalTitle
        }
    }
    
    var sauceImage: String = "" {
        didSet {
            thumbnailView.assetImage = sauceImage
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
        thumbnailView.constraintEdge(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
