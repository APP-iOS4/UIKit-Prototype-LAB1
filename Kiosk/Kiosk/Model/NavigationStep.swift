//
//  NavigationStep.swift
//  Kiosk
//
//  Created by 박상현 on 1/18/24.
//

import UIKit

enum NavigationStep: String, CaseIterable {
    case choiceBread = "빵선택"
    case choiceTopping = "토핑선택"
    case choiceVegitable = "야채선택"
    case choiceSauceSet = "소스 및 세트"
    
    func getTitleString() -> NSAttributedString {
        let allString = "\(NavigationStep.choiceBread.rawValue) ＞ \(NavigationStep.choiceTopping.rawValue) ＞ \(NavigationStep.choiceVegitable.rawValue) ＞ \(NavigationStep.choiceSauceSet.rawValue)"
        guard let range = allString.range(of: self.rawValue) else { return NSAttributedString() }
        
        let nsRange = NSRange(range, in: allString)
        let attributedString = NSMutableAttributedString(string: allString)
        let boldFont = UIFont.boldSystemFont(ofSize: 30)
        attributedString.addAttribute(.foregroundColor, value: UIColor.init(named: "mainOrange"), range: nsRange)
        attributedString.addAttribute(.font, value: boldFont, range: nsRange)
        
        return attributedString
    }
}
