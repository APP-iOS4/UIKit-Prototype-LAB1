//
//  PaymentMethodViewController.swift
//  Kiosk
//
//  Created by woong on 1/18/24.
//

import UIKit

class PaymentMethodViewController: CommonOrderViewController {

    var cardButton = PaymentButton()
    var naverButton = PaymentButton()
    var kakaoButton = PaymentButton()
    var cashButton = PaymentButton()
    
    var whichButtonSeleted = 0 // 1: 카드, 2: 네이버, 3: 카카오, 4: 현금
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar.title = "장바구니"
    }
    
    override func setupView() {
        super.setupView()
        let screenWidth = self.view.bounds.width
        let sideBarWidth = sideBar.frame.width
        cardButton.tag = 1
        naverButton.tag = 2
        kakaoButton.tag = 3
        cashButton.tag = 4
        
        cardButton.layer.cornerRadius = 15
        cardButton.layer.borderWidth = 5
        cardButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
        
        naverButton.layer.cornerRadius = 15
        naverButton.layer.borderWidth = 5
        naverButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
        
        kakaoButton.layer.cornerRadius = 15
        kakaoButton.layer.borderWidth = 5
        kakaoButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
        
        cashButton.layer.cornerRadius = 15
        cashButton.layer.borderWidth = 5
        cashButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)

        cardButton.paymentTitle = "카드"
        cardButton.paymentEngTitle = "Card"
//        cardButton.paymentImageView.image = UIImage(named: <#T##String#>)
        
        naverButton.paymentTitle = "네이버 페이"
        naverButton.paymentEngTitle = "Naver Pay"
        naverButton.containerView.backgroundColor = .systemGreen
//        naverButton.paymentImageView.image = UIImage(named: <#T##String#>)
        
        kakaoButton.paymentTitle = "카카오 페이"
        kakaoButton.paymentEngTitle = "Kakao Pay"
        kakaoButton.containerView.backgroundColor = .systemYellow
//        kakaoButton.paymentImageView.image = UIImage(named: <#T##String#>)
        
        cashButton.paymentTitle = "현금"
        cashButton.paymentEngTitle = "Cash"
//        cashButton.paymentImageView.image = UIImage(named: <#T##String#>)
        
        self.view.customAddSubView(cardButton)
        self.view.customAddSubView(naverButton)
        self.view.customAddSubView(kakaoButton)
        self.view.customAddSubView(cashButton)
        
        NSLayoutConstraint.activate([
            cardButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 200),
            cardButton.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor, constant: 100),
            cardButton.widthAnchor.constraint(equalToConstant: (screenWidth - sideBarWidth - 300) / 4),
            cardButton.heightAnchor.constraint(equalTo: cardButton.containerView.heightAnchor),
            
            
            naverButton.leadingAnchor.constraint(equalTo: cardButton.trailingAnchor, constant: 100),
            naverButton.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor, constant: 100),
            naverButton.widthAnchor.constraint(equalToConstant: (screenWidth - sideBarWidth - 300) / 4),
            naverButton.heightAnchor.constraint(equalTo: naverButton.containerView.heightAnchor),
            
            kakaoButton.topAnchor.constraint(equalTo: cardButton.bottomAnchor, constant: 20),
            kakaoButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 200),
            kakaoButton.widthAnchor.constraint(equalToConstant: (screenWidth - sideBarWidth - 300) / 4),
            kakaoButton.heightAnchor.constraint(equalTo: kakaoButton.containerView.heightAnchor),
            
            cashButton.topAnchor.constraint(equalTo: naverButton.bottomAnchor, constant: 20),
            cashButton.leadingAnchor.constraint(equalTo: kakaoButton.trailingAnchor, constant: 100),
            cashButton.widthAnchor.constraint(equalToConstant: (screenWidth - sideBarWidth - 300) / 4),
            cashButton.heightAnchor.constraint(equalTo: cashButton.containerView.heightAnchor),
            
            
        ])
        // 버튼을 컨테이너뷰가 가려서 아래의 소스코드를 통해 uiview의 인터랙션을 막아버리고 그대로 밑의 버튼으로 이벤트 전달됨
        cardButton.containerView.isUserInteractionEnabled = false
        naverButton.containerView.isUserInteractionEnabled = false
        kakaoButton.containerView.isUserInteractionEnabled = false
        cashButton.containerView.isUserInteractionEnabled = false
        
        // 버튼에 함수 지정
        cardButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        naverButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        kakaoButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        cashButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            if whichButtonSeleted == 0 {
                cardButton.layer.borderColor = UIColor(named: "mainGreen")?.cgColor
                whichButtonSeleted = 1
            } else if whichButtonSeleted == 1 {
                cardButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
                whichButtonSeleted = 0
            } else {
                cardButton.layer.borderColor = UIColor(named: "mainGreen")?.cgColor
                whichButtonSeleted = 1
                naverButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
                kakaoButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
                cashButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
            }
        case 2: // naverbutton
            if whichButtonSeleted == 0 {
                naverButton.layer.borderColor = UIColor(named: "mainGreen")?.cgColor
                whichButtonSeleted = 2
            } else if whichButtonSeleted == 2 {
                naverButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
                whichButtonSeleted = 0
            } else {
                naverButton.layer.borderColor = UIColor(named: "mainGreen")?.cgColor
                whichButtonSeleted = 2
                cardButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
                kakaoButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
                cashButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
            }
            
        case 3: // kakaobutton
            if whichButtonSeleted == 0 {
                kakaoButton.layer.borderColor = UIColor(named: "mainGreen")?.cgColor
                whichButtonSeleted = 3
            } else if whichButtonSeleted == 3 {
                kakaoButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
                whichButtonSeleted = 0
            } else {
                kakaoButton.layer.borderColor = UIColor(named: "mainGreen")?.cgColor
                whichButtonSeleted = 3
                naverButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
                cardButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
                cashButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
            }
            
        case 4: // cashButton
            if whichButtonSeleted == 0 {
                cashButton.layer.borderColor = UIColor(named: "mainGreen")?.cgColor
                whichButtonSeleted = 4
            } else if whichButtonSeleted == 4 {
                cashButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
                whichButtonSeleted = 0
            } else {
                cashButton.layer.borderColor = UIColor(named: "mainGreen")?.cgColor
                whichButtonSeleted = 4
                naverButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
                kakaoButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
                cardButton.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
            }
        default:
            break
        }
    }
    

}
