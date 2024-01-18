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
    
    let uiView = UIView()
    
    var whichButtonSeleted = 0 // 1: 카드, 2: 네이버, 3: 카카오, 4: 현금
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupView() {
        super.setupView()
        let screenWidth = self.view.bounds.width
//        let screenHeight = self.view.bounds.height
        let sideBarWidth = sideBar.frame.width
        let customNaviHeight = customNavigationBar.frame.height
        cardButton.paymentTitle = "카드"
        cardButton.paymentEngTitle = "Card"
        
        naverButton.paymentTitle = "네이버 페이"
        naverButton.paymentEngTitle = "Naver Pay"
        naverButton.backgroundColor = .systemGreen
        
        kakaoButton.paymentTitle = "카카오 페이"
        kakaoButton.paymentEngTitle = "Kakao Pay"
        kakaoButton.backgroundColor = .systemYellow
        
        cashButton.paymentTitle = "현금"
        cashButton.paymentEngTitle = "Cash"
        
        self.view.customAddSubView(cardButton)
        self.view.customAddSubView(naverButton)
        self.view.customAddSubView(kakaoButton)
        self.view.customAddSubView(cashButton)
        
//        print(screenWidth - customNaviHeight - 300)
        
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
        
    }
    

}
