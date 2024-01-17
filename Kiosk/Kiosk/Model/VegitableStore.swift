//
//  VegitableStore.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import Foundation

class VegitableStore {
    var vegitableArray: [VegitableModel] = []
    
    init() {
        vegitableArray = [
            VegitableModel(name: "양상추", engName: "Luttuce", cal: "2.9 kcal", image: "image"),
            VegitableModel(name: "토마토", engName: "Tomatoes", cal: "7.7 kcal", image: "ㅇㅇ"),
            VegitableModel(name: "오이", engName: "Cucumbers", cal: "1.5 kcal", image: ""),
            VegitableModel(name: "피망", engName: "Peppers", cal: "1.4 kcal", image: ""),
            VegitableModel(name: "양파", engName: "Red Onions", cal: "2.8 kcal", image: ""),
            VegitableModel(name: "피클", engName: "Pickles", cal: "0.4 kcal", image: ""),
            VegitableModel(name: "올리브", engName: "Olives", cal: "3.9 kcal", image: ""),
            VegitableModel(name: "할라피뇨", engName: "Jalapenos", cal: "0.6 kcal", image: ""),
            VegitableModel(name: "아보카도", engName: "Avocado", cal: "56.5 kcal", image: ""),
        ]
    }
}
