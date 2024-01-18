//
//  Vegitable.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import UIKit

class VegitableCell: UICollectionViewCell {
    
    static let identifier: String = "vegitableCell"
    
    let thumbnailView = ThumbnailView()
    
    var vegitableTitle: String = "" {
        didSet {
            thumbnailView.title = vegitableTitle
        }
    }
    
    var vegitableEngTitle: String = "" {
        didSet {
            thumbnailView.subTitle = vegitableEngTitle
        }
    }
    
    var vegitableCalTitle: String = "" {
        didSet {
            thumbnailView.highlightTitle = vegitableCalTitle
        }
    }
    
    var vegitableImage: String = "" {
        didSet {
            thumbnailView.assetImage = vegitableImage
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



