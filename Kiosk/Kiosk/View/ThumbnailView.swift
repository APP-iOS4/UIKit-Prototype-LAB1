//
//  ThumbnailView.swift
//  Kiosk
//
//  Created by 박상현 on 1/18/24.
//

import UIKit

class ThumbnailView: UIView {
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var subTitle: String = "" {
        didSet {
            subTitleLabel.text = subTitle
        }
    }
    
    var highlightTitle: String = "" {
        didSet {
            highlightTitleLabel.text = highlightTitle
        }
    }
    
    let containerView: UIView = UIView()
    let vegitableImageView: UIImageView = UIImageView()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let highlightTitleLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        containerView.backgroundColor = .white
        vegitableImageView.contentMode = .scaleAspectFit
        vegitableImageView.image = UIImage(named: "sample")
        //        vegitableImageView.backgroundColor = .black
        
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        titleLabel.textAlignment = .center
        titleLabel.sizeToFit()
        
        subTitleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        subTitleLabel.textColor = .init(named: "paymentEngLabel")
        subTitleLabel.textAlignment = .center
        subTitleLabel.sizeToFit()
        
        highlightTitleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        highlightTitleLabel.textColor = .init(named: "mainOrange")
        highlightTitleLabel.textAlignment = .center
        highlightTitleLabel.sizeToFit()
        
        customAddSubView(containerView)
        containerView.customAddSubView(vegitableImageView)
        containerView.customAddSubView(titleLabel)
        containerView.customAddSubView(subTitleLabel)
        containerView.customAddSubView(highlightTitleLabel)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: highlightTitleLabel.bottomAnchor, constant: 26),
            
            vegitableImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            vegitableImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 45),
            vegitableImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -45),
            vegitableImageView.heightAnchor.constraint(equalTo: vegitableImageView.widthAnchor, multiplier: 40.0 / 57.0),
            
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: vegitableImageView.bottomAnchor, constant: 33),
            
            subTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            
            highlightTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            highlightTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            highlightTitleLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension ThumbnailView {
    static func getDummyHeight(_ width: CGFloat) -> CGFloat {
        let dummyContainerView: UIView = {
            let dummyContainerView = UIView()
            dummyContainerView.frame = CGRect(x: 0, y: 0, width: width, height: 0)
            return dummyContainerView
        }()
        
        let dummyView = ThumbnailView()
        dummyView.translatesAutoresizingMaskIntoConstraints = false
        dummyView.title = "dummy"
        dummyView.subTitle = "dummy"
        dummyView.highlightTitle = "dummy"
        
        dummyContainerView.addSubview(dummyView)
        dummyView.constraintEdge(dummyContainerView)
        
        dummyContainerView.layoutIfNeeded()
        print(dummyView.containerView.frame.height)
        
        return dummyView.containerView.frame.height
    }
}
