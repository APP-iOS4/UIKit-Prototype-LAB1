//
//  CommonOrderViewController.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import UIKit

class CommonOrderViewController: CommonViewController  {

    let sideBar = SideBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setupView() {
        super.setupView()
        
        view.customAddSubView(sideBar)
        
        NSLayoutConstraint.activate([
            sideBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            sideBar.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor),
            sideBar.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            sideBar.widthAnchor.constraint(equalToConstant: 326),
        ])
    }

}
