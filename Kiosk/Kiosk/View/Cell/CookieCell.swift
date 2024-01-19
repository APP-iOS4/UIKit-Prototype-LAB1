//
//  CookieCell.swift
//  Kiosk
//
//  Created by Woo Sung jong on 1/19/24.
//

import UIKit

class CookieCell: UICollectionViewCell {
    static let identifier: String = "cookieCell"
    
    let thumbnailView = ThumbnailView()
    
    var cookieTitle: String = "" {
        didSet {
            thumbnailView.title = cookieTitle
        }
    }
    
    var cookieEngTitle: String = "" {
        didSet {
            thumbnailView.subTitle = cookieEngTitle
        }
    }
    
    var cookieCalTitle: String = "" {
        didSet {
            thumbnailView.highlightTitle = cookieCalTitle
        }
    }
    
    var cookieImage: String = "" {
        didSet {
            thumbnailView.assetImage = cookieImage
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
