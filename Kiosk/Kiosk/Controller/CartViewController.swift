//
//  CartViewController.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import UIKit

class CartViewController: CommonViewController {
    
    let breadButton = ChoiceButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        customNavigationBar.delegate = self
        customNavigationBar.title = "ewjrwehrwekjrhwer"
        
        breadButton.buttonTitle = "15cm"
        breadButton.isSelected = true
        breadButton.delegate = self
        
        view.customAddSubView(breadButton)
        
        NSLayoutConstraint.activate([
            breadButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            breadButton.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            breadButton.widthAnchor.constraint(equalToConstant: 343),
            breadButton.heightAnchor.constraint(equalToConstant: 83),
        ])
    }
    

}

extension CartViewController: CustomNavigationBarProtocol {
    func didTapHomeButton() {

    }
    
    func didTapRightButton() {

    }
    
    func didTapBackButton() {

    }

}

extension CartViewController: ChoiceButtonProtocol {
    func didTapButton() {
        breadButton.isSelected.toggle()
    }
    
    
}
