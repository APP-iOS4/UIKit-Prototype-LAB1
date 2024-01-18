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

        sideBar.sideBarButton.delegate = self
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

    // 사이드바 버튼 터치 함수 (하위 뷰컨트롤러에서 오버라이딩 하기 위한 함수)
    func didTapSideBarButton() {
        
    }
}

// MARK: - 사이드바 버튼 델리게이트
extension CommonOrderViewController: ChoiceButtonProtocol {
    func didTapButton() {
        didTapSideBarButton()
    }
    
    
}
