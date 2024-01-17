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
        customNavigationBar.delegate = self
        customNavigationBar.title = "타이틀 테스트"
        
    }

}


extension ViewController: CustomNavigationBarProtocol {
    func didTapHomeButton() {
        print("홈버튼 눌림")
    }
    
    func didTapRightButton() {
        print("우측 버튼 눌림")
    }
    
    func didTapBackButton() {
        print("백 버튼 눌림")
    }
    
    
}
