//
//  CartListCell.swift
//  Kiosk
//
//  Created by 박상현 on 1/18/24.
//

import UIKit

class CartListCell: UITableViewCell {

    static let identifier: String = "cartListCell"
    
    let thumbnailView = ThumbnailView()
    let productLabel = UILabel()
    
    // MARK: 프로퍼티
    // 에셋 이미지
    var assetImage: String = "" {
        didSet {
            thumbnailView.assetImage = assetImage
        }
    }
    
    // 타이틀 텍스트
    var title: String = "" {
        didSet {
            thumbnailView.title = title
            productLabel.text = title
        }
    }
    
    // 서브 타이틀 텍스트
    var subTitle: String = "" {
        didSet {
            thumbnailView.subTitle = subTitle
        }
    }
    
    // 하이라이트 라벨
    var highlightTitle: String = "" {
        didSet {
            thumbnailView.highlightTitle = highlightTitle
        }
    }
    
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let thumbnailViewWidth: CGFloat = 297
        let thumbnailViewHeight: CGFloat = ThumbnailView.getDummyHeight(thumbnailViewWidth, isHighlightTitle: true)
        
        productLabel.font = .systemFont(ofSize: 30, weight: .regular)
        
        self.backgroundColor = .clear
        customAddSubView(productLabel)
        customAddSubView(thumbnailView)
        
        NSLayoutConstraint.activate([
            productLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            productLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            productLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            thumbnailView.leadingAnchor.constraint(equalTo: productLabel.leadingAnchor),
            thumbnailView.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: 15),
            thumbnailView.widthAnchor.constraint(equalToConstant: 297),
            thumbnailView.heightAnchor.constraint(equalToConstant: thumbnailViewHeight),
            thumbnailView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
            
        ])
        
        self.selectionStyle = .none
        
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
