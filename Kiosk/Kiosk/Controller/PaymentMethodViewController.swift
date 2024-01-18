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
    }
    
    override func setupView() {
        super.setupView()
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height
        
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
        
        NSLayoutConstraint.activate([
            cardButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 100),
            cardButton.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor, constant: 100),
            
//            cardButton.widthAnchor.constraint(equalToConstant: sideBar.leadingAnchor / 2),
            
//            cardButton.heightAnchor.constraint(equalToConstant: <#T##CGFloat#>),
            
        ])
        
    }
    

}
