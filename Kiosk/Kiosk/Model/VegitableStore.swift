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
            VegitableModel(name: "양상추", engName: "Luttuce", cal: "2.9 kcal", image: "v01"),
            VegitableModel(name: "토마토", engName: "Tomatoes", cal: "7.7 kcal", image: "v02"),
            VegitableModel(name: "오이", engName: "Cucumbers", cal: "1.5 kcal", image: "v03"),
            VegitableModel(name: "피망", engName: "Peppers", cal: "1.4 kcal", image: "v04"),
            VegitableModel(name: "양파", engName: "Red Onions", cal: "2.8 kcal", image: "v05"),
            VegitableModel(name: "피클", engName: "Pickles", cal: "0.4 kcal", image: "v06"),
            VegitableModel(name: "올리브", engName: "Olives", cal: "3.9 kcal", image: "v07"),
            VegitableModel(name: "할라피뇨", engName: "Jalapenos", cal: "0.6 kcal", image: "v08"),
            VegitableModel(name: "아보카도", engName: "Avocado", cal: "56.5 kcal", image: "v09"),
        ]
    }
}
