//
//  ChoiceButton.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import UIKit

class ChoiceButton: UIView {
    
    var delegate: ChoiceButtonProtocol?
    
    var buttonTitle: String = "" {
        didSet {
            buttonLabel.text = buttonTitle
        }
    }
    
    var isSelected: Bool = false {
        didSet {
            if isSelected == true {
                containerView.layer.borderColor = UIColor(named: "mainGreen")?.cgColor
            } else {
                containerView.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
            }
        }
    }

    let buttonLabel: UILabel = UILabel()
    let containerView: UIView = UIView()
    let button: UIButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        containerView.backgroundColor = .white
        containerView.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        containerView.layer.borderWidth = 4
        containerView.layer.cornerRadius = 15
        
        buttonLabel.textColor = .black
        buttonLabel.textAlignment = .center
        buttonLabel.font = .systemFont(ofSize: 30, weight: .regular)
        
        button.addTarget(delegate, action: #selector(didTapButton), for: .touchUpInside)

        customAddSubView(containerView)
        containerView.customAddSubView(buttonLabel)
        containerView.customAddSubView(button)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            buttonLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            buttonLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            buttonLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            buttonLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapButton() {
        delegate?.didTapButton(self)
    }

}
