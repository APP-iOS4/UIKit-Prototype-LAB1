//
//  CartViewController.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import UIKit

class CartViewController: CommonViewController {
    
    let breadButton = ChoiceButton()
    let cardButton = PaymentButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        customNavigationBar.title = "ewjrwehrwekjrhwer"

        cardButton.paymentTitle = "카드 결제"
        cardButton.paymentEngTitle = "Cards"
        
        view.customAddSubView(cardButton)
        
        NSLayoutConstraint.activate([
            cardButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            cardButton.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            cardButton.widthAnchor.constraint(equalToConstant: 349),
            cardButton.bottomAnchor.constraint(equalTo: cardButton.paymentEngLabel.bottomAnchor, constant: 26)
        ])
    }
    

}
