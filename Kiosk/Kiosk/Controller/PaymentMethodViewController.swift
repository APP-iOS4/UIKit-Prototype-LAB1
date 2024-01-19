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
        customNavigationBar.title = "결제수단 선택"
        sideBar.sideBarButton.setTitle("결제하기", color: .init(named: "mainOrange"), isActive: true)
    }
    
    override func didTapSideBarButtonOverride() {
        navigationController?.pushViewController(OrderCompleteViewController(), animated: true)
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
        cardButton.containerView.backgroundColor = .white
        cardButton.paymentImageView.image = UIImage(named: "card")
        
        naverButton.paymentTitle = "네이버 페이"
        naverButton.paymentEngTitle = "Naver Pay"
        naverButton.containerView.backgroundColor = UIColor(red: 90/255, green: 197/255, blue: 81/255, alpha: 1)
        naverButton.paymentImageView.image = UIImage(named: "npay")
        naverButton.paymentEngLabel.textColor = .white
        
        kakaoButton.paymentTitle = "카카오 페이"
        kakaoButton.paymentEngTitle = "Kakao Pay"
        kakaoButton.containerView.backgroundColor = UIColor(red: 251/255, green: 225/255, blue: 76/255, alpha: 1)
        kakaoButton.paymentImageView.image = UIImage(named: "kpay")
        kakaoButton.paymentEngLabel.textColor = .white
        
        cashButton.paymentTitle = "현금"
        cashButton.paymentEngTitle = "Cash"
        cashButton.containerView.backgroundColor = .white
        cashButton.paymentImageView.image = UIImage(named: "cash")
        
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
                cardButton.isSelect.toggle()
                whichButtonSeleted = 1
            } else if whichButtonSeleted == 1 {
                cardButton.isSelect.toggle()
                whichButtonSeleted = 0
            } else {
                cardButton.isSelect.toggle()
                whichButtonSeleted = 1
                if naverButton.isSelect == true {
                    naverButton.isSelect.toggle()
                }
                if kakaoButton.isSelect == true {
                    kakaoButton.isSelect.toggle()
                }
                if cashButton.isSelect == true {
                    cashButton.isSelect.toggle()
                }
            }
        case 2: // naverbutton
            if whichButtonSeleted == 0 {
                naverButton.isSelect.toggle()
                whichButtonSeleted = 2
            } else if whichButtonSeleted == 2 {
                naverButton.isSelect.toggle()
                whichButtonSeleted = 0
            } else {
                naverButton.isSelect.toggle()
                whichButtonSeleted = 2
                if cardButton.isSelect == true {
                    cardButton.isSelect.toggle()
                }
                if kakaoButton.isSelect == true {
                    kakaoButton.isSelect.toggle()
                }
                if cashButton.isSelect == true {
                    cashButton.isSelect.toggle()
                }
            }
            
        case 3: // kakaobutton
            if whichButtonSeleted == 0 {
                kakaoButton.isSelect.toggle()
                whichButtonSeleted = 3
            } else if whichButtonSeleted == 3 {
                kakaoButton.isSelect.toggle()
                whichButtonSeleted = 0
            } else {
                kakaoButton.isSelect.toggle()
                whichButtonSeleted = 3
                if cardButton.isSelect == true {
                    cardButton.isSelect.toggle()
                }
                if naverButton.isSelect == true {
                    naverButton.isSelect.toggle()
                }
                if cashButton.isSelect == true {
                    cashButton.isSelect.toggle()
                }
            }
            
        case 4: // cashButton
            if whichButtonSeleted == 0 {
                cashButton.isSelect.toggle()
                whichButtonSeleted = 4
            } else if whichButtonSeleted == 4 {
                cashButton.isSelect.toggle()
                whichButtonSeleted = 0
            } else {
                cashButton.isSelect.toggle()
                whichButtonSeleted = 4
                if cardButton.isSelect == true {
                    cardButton.isSelect.toggle()
                }
                if naverButton.isSelect == true {
                    naverButton.isSelect.toggle()
                }
                if kakaoButton.isSelect == true {
                    kakaoButton.isSelect.toggle()
                }
            }
        default:
            break
        }
    }
    

}
