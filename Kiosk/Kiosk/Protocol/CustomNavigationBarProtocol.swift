//
//  CustomNavigationBarProtocol.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import Foundation

// 커스텀 네비게이션바 프로토콜
@objc protocol CustomNavigationBarProtocol {
    // 홈버튼 눌렀을때
    func didTapHomeButton()
    // 오른쪽 버튼 눌렀을때
    func didTapRightButton()
    // 백버튼 눌렸을때
    func didTapBackButton()
}
