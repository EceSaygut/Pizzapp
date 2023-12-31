//
//  RowView.swift
//  Pizzapp
//
//  Created by Ece Saygut on 27.08.2023.
//
import SwiftUI

struct RowView: View {
    var pizza: Pizza
    var totalPrice: Double
    
    var body: some View {
        HStack {
            Image(pizza.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(8)
                .padding(.leading, 15)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(pizza.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(pizza.ingredients.joined(separator: ", "))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Text("\(totalPrice, specifier: "%.2f") TL")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.red)
            }
            .padding(.leading, 8)
            
            Spacer()
        }
        .padding(.vertical, 8)
        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height / 6)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}


