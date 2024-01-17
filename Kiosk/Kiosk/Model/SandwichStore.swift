//
//  SandwichModel.swift
//  Kiosk
//
//  Created by woong on 1/17/24.
//

import Foundation

class SandwichStore {
    var sandwiches: [ComponentStruct] = []
    
    init() {
        sandwiches = [
            ComponentStruct(korName: "랍스터", engName: "Lobster", cal: 320),
            ComponentStruct(korName: "하프 랍스터 & 하프 쉬림프", engName: "Half Lobster & Half Shrimp", cal: 284),
            ComponentStruct(korName: "스테이크 & 치즈", engName: "Steak & Cheese", cal: 355),
            ComponentStruct(korName: "치킨 베이컨 아보카도", engName: "Chicken Bacon Avocado", cal: 355),
            ComponentStruct(korName: "스파이시 쉬림프", engName: "Spicy Shrimp", cal: 245),
            ComponentStruct(korName: "쉬림프", engName: "Shrimp", cal: 241),
            ComponentStruct(korName: "로스트 치킨", engName: "Roasted Chicken", cal: 300),
            ComponentStruct(korName: "로티세리 바비큐 치킨", engName: "Rotisserie Barbecue Chicken", cal: 327),
            ComponentStruct(korName: "K-바비큐", engName: "K-BBQ", cal: 372),
            ComponentStruct(korName: "풀드 포크 바비큐", engName: "Pulled Pork Barbecue", cal: 327),
            ComponentStruct(korName: "써브웨이 클럽", engName: "Subway Club", cal: 299),
            ComponentStruct(korName: "치킨 데리야끼", engName: "Chicken Teriyaki", cal: 314),
            ComponentStruct(korName: "스파이시 이탈리안", engName: "Spicy Italian", cal: 464),
            ComponentStruct(korName: "이탈리안 비엠티", engName: "Italian B.M.T.", cal: 388),
            ComponentStruct(korName: "비엘티", engName: "B.L.T.", cal: 300),
            ComponentStruct(korName: "치킨 슬라이스", engName: "Chicken Slice", cal: 265),
            ComponentStruct(korName: "참치", engName: "Tuna", cal: 316),
            ComponentStruct(korName: "햄", engName: "Ham", cal: 262),
            ComponentStruct(korName: "에그마요", engName: "Egg Mayo", cal: 416),
            ComponentStruct(korName: "베지", engName: "Veggie Delite", cal: 209)
        ]
    }
}
