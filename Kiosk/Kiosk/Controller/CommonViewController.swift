//
//  CommonViewController.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import UIKit

class CommonViewController: UIViewController {
    
    let customNavigationBar = CustomNavigationBar()
    lazy var safeArea = self.view.safeAreaLayoutGuide

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
    }
    
    func setupView() {
        self.view.backgroundColor = .systemGray6
        
        // 네비게이션바
        view.customAddSubView(customNavigationBar)
        NSLayoutConstraint.activate([
            customNavigationBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            customNavigationBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            customNavigationBar.topAnchor.constraint(equalTo: safeArea.topAnchor),
            customNavigationBar.heightAnchor.constraint(equalToConstant: 93)
        ])
    }

}

