//
//  PizzaModel.swift
//  Pizzapp
//
//  Created by Ece Saygut on 25.04.2023.
//

import Foundation

struct Pizza: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let ingredients: [String]
    var price: Double
}

let pizzas = [
    Pizza(imageName: "pizza1", name: "Mediterranean", ingredients: ["Pizza Sosu", "Mozzarella Peyniri", "Siyah Zeytin", "Domates", "Mantar", "Yeşil Biber"], price: 60.0),
    Pizza(imageName: "pizza2", name: "Chef Special", ingredients: ["Pizza Sosu", "Mozzarella Peyniri", "Sosis", "Turşu", "Fesleğen"], price: 65.0),
    Pizza(imageName: "pizza3", name: "Supreme", ingredients: ["Pizza Sosu", "Mozzarella Peyniri", "Mantar", "Salam"], price: 62.0),
    Pizza(imageName: "pizza4", name: "Pepperoni", ingredients: ["Pizza Sosu", "Mozzarella Peyniri", "Pepperoni"], price: 68.0),
    Pizza(imageName: "pizza5", name: "Pepperoni-Fresh Basil", ingredients: ["Pizza Sosu", "Mozzarella Peyniri", "Pepperoni", "Fesleğen"], price: 63.0),
]



