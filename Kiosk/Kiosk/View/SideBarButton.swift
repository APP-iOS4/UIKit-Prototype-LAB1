//
//  SideBarButton.swift
//  Kiosk
//
//  Created by 박상현 on 1/18/24.
//

import UIKit

class SideBarButton: UIView {

    var isActive: Bool = false {
        didSet {
            if isActive {
                containerView.backgroundColor = .init(named: "mainOrange")
            } else {
                containerView.backgroundColor = .black.withAlphaComponent(0.27)
            }
        }
    }
    
    var buttonActiveColor: UIColor? = nil
    let containerView: UIView = UIView()
    let titleLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.font = .systemFont(ofSize: 27, weight: .bold)
        titleLabel.textAlignment = .center
        
        let button: UIButton = UIButton()
        
        containerView.backgroundColor = .black.withAlphaComponent(0.27)
        
        customAddSubView(containerView)
        containerView.customAddSubView(titleLabel)
        containerView.customAddSubView(button)
        
        containerView.constraintEdge(self)
        titleLabel.constraintEdge(containerView)
        button.constraintEdge(containerView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // 버튼의 레이블, 활성화 상태 설정 (처음 사용시 꼭 이거로 사용을...)
    func setTitle(_ title: String, color: UIColor?, isActive: Bool) {
        titleLabel.text = title
        containerView.backgroundColor = color
        buttonActiveColor = color
        self.isActive = isActive
    }
    
    // 버튼의 타이틀, 색상 설정
    func setTitle(_ title: String, color: UIColor?) {
        titleLabel.text = title
        containerView.backgroundColor = color
    }
    
    // 버튼의 타이틀 설정
    func setTitleLabel(_ title: String) {
        titleLabel.text = title
    }
    
    // 버튼의 배경 색상 설정
    func setBackgroundColor(_ color: UIColor?) {
        containerView.backgroundColor = color
    }
    
}
