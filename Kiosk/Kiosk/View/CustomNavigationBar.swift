//
//  CustomNavigationBar.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import UIKit

class CustomNavigationBar: UIView {
    
    var delegate: CustomNavigationBarProtocol?
    
    var titleLabel: UILabel = UILabel()
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var attributedTitle: NSAttributedString? = nil {
        didSet {
            titleLabel.attributedText = attributedTitle
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let containerView: UIView = {
            let containerView = UIView()
            containerView.translatesAutoresizingMaskIntoConstraints = false
            containerView.backgroundColor = .init(named: "mainGreen")
            return containerView
        }()
        
        let backButton: UIButton = {
            let backButton = UIButton(type: .custom)
            backButton.setImage(.init(systemName: "chevron.backward"), for: .normal)
            backButton.setPreferredSymbolConfiguration(.init(pointSize: 35, weight: .regular, scale: .default), forImageIn: .normal)
            backButton.tintColor = .init(named: "mainOrange")
            backButton.addTarget(delegate, action: #selector(didTapBackbutton), for: .touchUpInside)
            return backButton
        }()
        
        let homeButton: UIButton = {
            let homeButton = UIButton()
            homeButton.setImage(.init(systemName: "house"), for: .normal)
            homeButton.setPreferredSymbolConfiguration(.init(pointSize: 35, weight: .regular, scale: .default), forImageIn: .normal)
            homeButton.tintColor = .white
            homeButton.addTarget(delegate, action: #selector(didTapHomebutton), for: .touchUpInside)
            return homeButton
        }()
        
        let rightButton: UIButton = {
            let rightButton = UIButton()
            rightButton.setImage(.init(systemName: "cart"), for: .normal)
            rightButton.setPreferredSymbolConfiguration(.init(pointSize: 35, weight: .regular, scale: .default), forImageIn: .normal)
            rightButton.tintColor = .init(named: "mainOrange")
            rightButton.addTarget(delegate, action: #selector(didTapRightButton), for: .touchUpInside)
            return rightButton
        }()
        
        titleLabel.text = "텍스트"
        titleLabel.font = .systemFont(ofSize: 30, weight: .regular)
        titleLabel.textColor = .white
        titleLabel.sizeToFit()
        
        customAddSubView(containerView)
        containerView.customAddSubView(backButton)
        containerView.customAddSubView(titleLabel)
        containerView.customAddSubView(homeButton)
        containerView.customAddSubView(rightButton)
        
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            backButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 28.3),
            backButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 46),
            backButton.heightAnchor.constraint(equalToConstant: 46),
            
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            homeButton.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 8),
            homeButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            homeButton.widthAnchor.constraint(equalToConstant: 46),
            homeButton.heightAnchor.constraint(equalToConstant: 46),
            
            rightButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -28.3),
            rightButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            rightButton.widthAnchor.constraint(equalToConstant: 46),
            rightButton.heightAnchor.constraint(equalToConstant: 46),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func didTapBackbutton() {
        delegate?.didTapBackButton()
    }
    
    @objc func didTapHomebutton() {
        delegate?.didTapHomeButton()
    }
    
    @objc func didTapRightButton() {
        delegate?.didTapRightButton()
    }
}

