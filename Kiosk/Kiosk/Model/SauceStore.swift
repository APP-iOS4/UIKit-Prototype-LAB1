//
//  SandwichModel.swift
//  Kiosk
//
//  Created by woong on 1/17/24.
//

import Foundation

class SauceStore {
    var sauces: [ComponentStruct] = []
    
    init() {
        sauces = [
            ComponentStruct(korName: "랜치", engName: "Ranch", cal: 116),
            ComponentStruct(korName: "스위트 어니언", engName: "Sweet Onion", cal: 40),
            ComponentStruct(korName: "마요네즈", engName: "Mayonnaise", cal: 158),
            ComponentStruct(korName: "스위트 칠리", engName: "Sweet Chilli", cal: 40),
            ComponentStruct(korName: "스모크 바베큐", engName: "Smoke BBQ", cal: 33),
            ComponentStruct(korName: "핫 칠리", engName: "Hot Chilli", cal: 42),
            ComponentStruct(korName: "허니 머스터드", engName: "Honey Mustard", cal: 38),
            ComponentStruct(korName: "사우스웨스트 치폴레", engName: "Southwest Chipotle", cal: 96),
            ComponentStruct(korName: "홀스래디쉬", engName: "Horseradish", cal: 106),
            ComponentStruct(korName: "머스타드", engName: "Yellow Mustard", cal: 15),
            ComponentStruct(korName: "올리브 오일", engName: "Olive Oil", cal: 124),
            ComponentStruct(korName: "레드 와인 식초", engName: "Lobster", cal: 1),
            ComponentStruct(korName: "소금", engName: "Salt", cal: 0),
            ComponentStruct(korName: "후추", engName: "Black Pepper", cal: 0)
        ]
    }
}
