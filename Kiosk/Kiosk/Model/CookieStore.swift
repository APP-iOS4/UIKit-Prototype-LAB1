//
//  SandwichModel.swift
//  Kiosk
//
//  Created by woong on 1/17/24.
//

import Foundation

class CookieStore {
    var cookies: [ComponentStruct] = []
    
    init() {
        cookies = [
            ComponentStruct(korName: "더블 초코칩", engName: "Double Chocolate Chip", cal: 212),
            ComponentStruct(korName: "초코칩", engName: "Chocolate Chip", cal: 228),
            ComponentStruct(korName: "오트밀 레이즌", engName: "Oatmeal Raisin", cal: 200),
            ComponentStruct(korName: "라즈베리 치즈케익", engName: "Raspberry Cheese Cake", cal: 204),
            ComponentStruct(korName: "화이트 초코 마카다미아", engName: "White Choco Macadamia", cal: 245)
        ]
    }
}
