//
//  UIView+Extension.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import UIKit

extension UIView {
    
    // addSubView 동시에 오토레이아웃 제약 사용한다고 자동으로 설정
    func customAddSubView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
    
    // 모든 엣지에 대한 오토레이아웃
    func constraintEdge(_ targetView: UIView) {
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: targetView.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: targetView.trailingAnchor),
            self.topAnchor.constraint(equalTo: targetView.topAnchor),
            self.bottomAnchor.constraint(equalTo: targetView.bottomAnchor),
            
        ])
    }
}
