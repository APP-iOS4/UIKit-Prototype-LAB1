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
    var orderListView = UIStackView()
    // 스택뷰 여백
    let spacer: UIView = {
        let spacer = UIView()
        spacer.isUserInteractionEnabled = false
        spacer.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
        spacer.setContentCompressionResistancePriority(.fittingSizeLevel, for: .vertical)
        return spacer
    }()
    
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
    
    // 오더 상세 내역
    var orderList: [String] = [] {
        didSet {
            orderList.forEach { order in
                let orderLabel: UILabel = {
                    let orderLabel = UILabel()
                    orderLabel.text = "\(order)"
                    orderLabel.textColor = .black
                    orderLabel.font = .systemFont(ofSize: 24, weight: .regular)
                    return orderLabel
                }()
                
                self.orderListView.addArrangedSubview(orderLabel)
            }
            orderListView.addArrangedSubview(spacer)
        }
    }
    
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let thumbnailViewWidth: CGFloat = 297
        let thumbnailViewHeight: CGFloat = ThumbnailView.getDummyHeight(thumbnailViewWidth, isHighlightTitle: true)
        
        orderListView = {
            let orderListView = UIStackView()
            orderListView.axis = .vertical
            orderListView.distribution = .fillEqually
            orderListView.spacing = 10
            orderListView.alignment = .top
            return orderListView
        }()
        
        productLabel.font = .systemFont(ofSize: 30, weight: .regular)
        
        self.backgroundColor = .clear
        customAddSubView(productLabel)
        customAddSubView(thumbnailView)
        customAddSubView(orderListView)
        
        NSLayoutConstraint.activate([
            productLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            productLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            productLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            thumbnailView.leadingAnchor.constraint(equalTo: productLabel.leadingAnchor),
            thumbnailView.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: 15),
            thumbnailView.widthAnchor.constraint(equalToConstant: 297),
            thumbnailView.heightAnchor.constraint(equalToConstant: thumbnailViewHeight),
            thumbnailView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            orderListView.leadingAnchor.constraint(equalTo: thumbnailView.trailingAnchor, constant: 25),
            orderListView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            orderListView.topAnchor.constraint(equalTo: thumbnailView.topAnchor),
            orderListView.bottomAnchor.constraint(equalTo: thumbnailView.bottomAnchor),
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

    override func prepareForReuse() {
        super.prepareForReuse()
        
        assetImage = ""
        title = ""
        subTitle = ""
        highlightTitle = ""
        orderList = []
        orderListView.arrangedSubviews.forEach { view in
            NSLayoutConstraint.deactivate(view.constraints)
            self.orderListView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
}
