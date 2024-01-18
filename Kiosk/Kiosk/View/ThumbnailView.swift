//
//  ThumbnailView.swift
//  Kiosk
//
//  Created by 박상현 on 1/18/24.
//

import UIKit

class ThumbnailView: UIView {
    
    // 이미지 아래 가장 큰 타이틀 텍스트
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    // 타이틀 아래 회색 서브 타이틀 텍스트
    var subTitle: String = "" {
        didSet {
            subTitleLabel.text = subTitle
        }
    }
    
    // 칼로리 등을 표시하는 색깔이 들어간 텍스트
    var highlightTitle: String = "" {
        didSet {
            highlightTitleLabel.text = highlightTitle
            
            // 입력된 문자 유무에 따른 오토레이아웃 제약 설정
            if highlightTitle != "" {
                containerView.removeConstraint(containerViewBottomAnchorConstraint!)
                containerViewBottomAnchorConstraint = containerView.bottomAnchor.constraint(equalTo: highlightTitleLabel.bottomAnchor, constant: 26)
                containerViewBottomAnchorConstraint?.isActive = true
            }
        }
    }
    
    // 셀이 선택 되었나?
    var isSelect: Bool = false {
        didSet {
            if isSelect {
                containerView.layer.borderColor = UIColor(named: "mainGreen")?.cgColor
                containerView.layer.borderWidth = 4
            } else {
                containerView.layer.borderWidth = 0
            }
            selectImageView.isHidden.toggle()
        }
    }
    
    // 이미지 에셋의 이미지를 가져와서 이미지뷰 이미지 수정
    var assetImage: String = "" {
        didSet {
            thumbnailImageView.image = UIImage(named: "\(assetImage)")
        }
    }
    
    let containerView: UIView = UIView()
    let thumbnailImageView: UIImageView = UIImageView()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let highlightTitleLabel = UILabel()
    let selectImageView: UIImageView = {
        let selectImageView = UIImageView()
        selectImageView.image = UIImage(systemName: "checkmark.square.fill")
        selectImageView.tintColor = .init(named: "mainGreen")
        selectImageView.contentMode = .scaleAspectFit
        selectImageView.isHidden = true
        return selectImageView
    }()
    
    var containerViewBottomAnchorConstraint: NSLayoutConstraint?
    
    // 오토레이아웃 제약 변수
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        containerViewBottomAnchorConstraint = containerView.bottomAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 26)
        
        containerView.backgroundColor = .white
        thumbnailImageView.contentMode = .scaleAspectFit
        //        vegitableImageView.backgroundColor = .black // 이미지뷰 사이즈가 유동적으로 변경되는지 확인하기 위한 배경색
        
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
        containerView.customAddSubView(thumbnailImageView)
        containerView.customAddSubView(titleLabel)
        containerView.customAddSubView(subTitleLabel)
        containerView.customAddSubView(highlightTitleLabel)
        containerView.customAddSubView(selectImageView)
        
        containerViewBottomAnchorConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            
            thumbnailImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            thumbnailImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 45),
            thumbnailImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -45),
            thumbnailImageView.heightAnchor.constraint(equalTo: thumbnailImageView.widthAnchor, multiplier: 40.0 / 57.0),
            
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 33),
            
            subTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            
            highlightTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            highlightTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            highlightTitleLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 10),
            
            selectImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            selectImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            selectImageView.widthAnchor.constraint(equalToConstant: 30),
            selectImageView.heightAnchor.constraint(equalTo: selectImageView.widthAnchor),
        ])
        if !highlightTitle.isEmpty {
            NSLayoutConstraint.activate([

            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateConstraintHighlightLabel() {

    }
    
}


extension ThumbnailView {
    static func getDummyHeight(_ width: CGFloat, isHighlightTitle: Bool) -> CGFloat {
        let dummyContainerView: UIView = {
            let dummyContainerView = UIView()
            dummyContainerView.frame = CGRect(x: 0, y: 0, width: width, height: 0)
            return dummyContainerView
        }()
        
        let dummyView = ThumbnailView()
        dummyView.translatesAutoresizingMaskIntoConstraints = false
        dummyView.title = "dummy"
        dummyView.subTitle = "dummy"
        dummyView.highlightTitle = isHighlightTitle ? "dummy" : ""
        
        dummyContainerView.addSubview(dummyView)
        dummyView.constraintEdge(dummyContainerView)
        
        dummyContainerView.layoutIfNeeded()

        return dummyView.containerView.frame.height
    }
}
