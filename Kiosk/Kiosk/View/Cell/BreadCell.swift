//
//  BreadCell.swift
//  Kiosk
//
//  Created by 박상현 on 1/18/24.
//

import UIKit

class BreadCell: UICollectionViewCell {
    
    static let identifier: String = "breadCell"
    
    let thumbnailView = ThumbnailView()
    
    var breadTitle: String = "" {
        didSet {
            thumbnailView.title = breadTitle
        }
    }
    
    var breadEngTitle: String = "" {
        didSet {
            thumbnailView.subTitle = breadEngTitle
        }
    }
    
    var breadCalTitle: String = "" {
        didSet {
            thumbnailView.highlightTitle = breadCalTitle
        }
    }
    
    let breadImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        customAddSubView(thumbnailView)
        thumbnailView.constraintEdge(self)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
