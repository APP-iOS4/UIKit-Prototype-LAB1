//
//  OrderCompleteViewController.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import UIKit

class OrderCompleteViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        setupView()
    }
    
    func setupView() {
        let safeArea = view.safeAreaLayoutGuide
        
        view.backgroundColor = .init(named: "mainOrange")
        
        let numberLabel: UILabel = {
            let numberLabel = UILabel()
            numberLabel.text = "158"
            numberLabel.textColor = .black
            numberLabel.font = .systemFont(ofSize: 400, weight: .bold)
            numberLabel.sizeToFit()
            return numberLabel
        }()
        
        let topLabel: UILabel = {
            let topLabel = UILabel()
            topLabel.text = "주문이 완료되었습니다."
            topLabel.textColor = .black
            topLabel.font = .systemFont(ofSize: 70, weight: .bold)
            topLabel.sizeToFit()
            return topLabel
        }()
        
        let bottomLabel: UILabel = {
            let bottomLabel = UILabel()
            bottomLabel.text = "조리 후 번호로 불러드리겠습니다."
            bottomLabel.textColor = .black
            bottomLabel.font = .systemFont(ofSize: 70, weight: .bold)
            bottomLabel.sizeToFit()
            return bottomLabel
        }()
        
        let countLabel: UILabel = {
            let countLabel = UILabel()
            countLabel.text = "처음 화면으로  5..."
            countLabel.textColor = .white
            countLabel.font = .systemFont(ofSize: 40, weight: .regular)
            countLabel.sizeToFit()
            return countLabel
        }()
        
        let arrowImageView: UIImageView = {
            let arrowImageView = UIImageView()
            arrowImageView.image = UIImage(systemName: "chevron.backward")
            arrowImageView.contentMode = .scaleAspectFit
            arrowImageView.tintColor = .white
            return arrowImageView
        }()
        
        let button: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
            return button
        }()
        
        view.customAddSubView(numberLabel)
        view.customAddSubView(topLabel)
        view.customAddSubView(bottomLabel)
        view.customAddSubView(countLabel)
        view.customAddSubView(arrowImageView)
        view.customAddSubView(button)
        
        NSLayoutConstraint.activate([
            numberLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            
            topLabel.centerXAnchor.constraint(equalTo: numberLabel.centerXAnchor),
            topLabel.bottomAnchor.constraint(equalTo: numberLabel.topAnchor, constant: 10),
            
            bottomLabel.centerXAnchor.constraint(equalTo: numberLabel.centerXAnchor),
            bottomLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 10),
            
            countLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -64),
            countLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -38),
            
            arrowImageView.trailingAnchor.constraint(equalTo: countLabel.leadingAnchor, constant: -10),
            arrowImageView.centerYAnchor.constraint(equalTo: countLabel.centerYAnchor),
            arrowImageView.widthAnchor.constraint(equalToConstant: 46),
            arrowImageView.heightAnchor.constraint(equalToConstant: 35),
            
            button.topAnchor.constraint(equalTo: arrowImageView.topAnchor),
            button.leadingAnchor.constraint(equalTo: arrowImageView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: countLabel.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: arrowImageView.bottomAnchor)
        ])
        
    }
    
    @objc func didTapBackButton() {
        print("버튼 눌림")
        self.navigationController?.popToRootViewController(animated: true)
    }
}
