//
//  Cheese.swift
//  Kiosk
//
//  Created by woong on 1/17/24.
//

import Foundation

class CheeseStore {
    var cheese: [ComponentStruct] = []
    
    init() {
        cheese = [
            ComponentStruct(korName: "아메리칸 치즈", engName: "American Cheese", cal: 35),
            ComponentStruct(korName: "슈레드 치즈", engName: "Shredded Cheese", cal: 54),
            ComponentStruct(korName: "모차렐라 치즈", engName: "Mozzarella Cheese", cal: 44)
        ]
    }
}
