//
//  ToppingStore.swift
//  Kiosk
//
//  Created by woong on 1/17/24.
//

import Foundation

class ToppingStore {
    var toppings: [ComponentStruct] = []
    
    init() {
        toppings = [
            ComponentStruct(korName: "미트 추가", engName: "Meat", cal: nil),
            ComponentStruct(korName: "에그마요", engName: "Egg Mayo", cal: nil),
            ComponentStruct(korName: "베이컨", engName: "Bacon", cal: nil),
            ComponentStruct(korName: "치즈 추가", engName: "Cheese", cal: nil),
            ComponentStruct(korName: "아보카도", engName: "Avocado", cal: nil),
            ComponentStruct(korName: "오믈렛", engName: "Omelet", cal: nil),
            ComponentStruct(korName: "페퍼로니", engName: "Pepperoni", cal: nil)
        ]
    }
}
