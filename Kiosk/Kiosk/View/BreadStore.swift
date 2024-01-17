//
//  BreadStore.swift
//  Kiosk
//
//  Created by 기 표 on 1/17/24.
//

import Foundation

class BreadStore {
    var bread: [BreadStrct] = []
    
    init() {
        bread = [
            BreadStrct(breadTitle: "플랫브레드", breadEngTitle: "Flat Bread", breadKcalTitle: 467),
            BreadStrct(breadTitle: "허니오트", breadEngTitle: "Honey Oat", breadKcalTitle: 235),
            BreadStrct(breadTitle: "하티", breadEngTitle: "Hearty Italian", breadKcalTitle: 210),
            BreadStrct(breadTitle: "파마산 오레가노", breadEngTitle: "Parmesan Oregano", breadKcalTitle: 213),
            BreadStrct(breadTitle: "화이트", breadEngTitle: "White", breadKcalTitle: 202),
            BreadStrct(breadTitle: "위트", breadEngTitle: "Wheat", breadKcalTitle: 192),
        ]
    }
}
