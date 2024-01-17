//
//  ViewController.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import UIKit

class ViewController: CommonViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    override func setupView() {
        super.setupView()
        customNavigationBar.title = "타이틀 테스트"
        
    }

}

