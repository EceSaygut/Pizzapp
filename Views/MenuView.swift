//
//  ContentView.swift
//  Pizzapp
//
//  Created by Ece Saygut on 25.04.2023.
//
import SwiftUI

struct MenuView: View {
    @State private var showCart = false
    @State private var currentIndex = 0
    @State private var selectedIngredients = Array(repeating: true, count: 6)
    @State private var selectedExtraIngredients = Array(repeating: false, count: 10)
    @State private var selectedPizza: Pizza?
    
    let extraIngredients = ["Sosis", "Salam", "Sucuk", "Mısır", "Yeşil Biber", "Kırmızı Biber", "Soğan", "Zeytin", "Mantar", "Turşu"]
    
    var ingredients: [String] {
        return pizzas[currentIndex % pizzas.count].ingredients
    }
    
    var totalPrice: Double {
        var price = pizzas[currentIndex % pizzas.count].price
        
        for i in 0..<selectedExtraIngredients.count {
            if selectedExtraIngredients[i] {
                price += 3.0
            }
        }
        
        return price
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack {
                    Image(pizzas[currentIndex % pizzas.count].imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 270, height: 270)
                        .rotationEffect(.degrees(currentIndex % 2 == 1 ? 180 : 0))
                        .animation(.spring(response: 0.5, dampingFraction: 0.8))
                        .onTapGesture {
                            self.currentIndex += 1
                            clearExtraIngredients()
                        }
                        .offset(y: -8)
                    
                    Text(pizzas[currentIndex % pizzas.count].name)
                        .font(.custom("Roboto-Regular", size: 35))
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .offset(y: -10)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 10) {
                            Text("Mevcut Malzemeler")
                                .font(.custom("Roboto-Medium", size: 27))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                            
                            ForEach(Array(zip(ingredients, selectedIngredients)), id: \.0) { ingredient, isChecked in
                                
                                HStack {
                                    Text(ingredient)
                                        .font(.custom("Roboto-Light", size: 24))
                                    
                                    Spacer()
                                    
                                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                                        .foregroundColor(isChecked ? .green : .black)
                                        .onTapGesture {
                                            selectedIngredients[ingredients.firstIndex(of: ingredient)!].toggle()
                                        }
                                }
                            }
                            
                            Text("Ekstra Malzemeler")
                                .font(.custom("Roboto-Medium", size: 27))
                                .fontWeight(.bold)
                                .padding(.top, 20)
                                .multilineTextAlignment(.center)
                            
                            ForEach(Array(zip(extraIngredients, selectedExtraIngredients)), id: \.0) { extraIngredient, isChecked in
                                HStack {
                                    Text(extraIngredient)
                                        .font(.custom("Roboto-Light", size: 24))
                                    
                                    Spacer()
                                    
                                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                                        .foregroundColor(isChecked ? .green : .black)
                                        .onTapGesture {
                                            if let index = extraIngredients.firstIndex(of: extraIngredient) {
                                                selectedExtraIngredients[index].toggle()
                                                if selectedExtraIngredients[index] {
                                                    print(extraIngredient + " eklendi.")
                                                } 
                                            }
                                        }
                                }
                            }
                        }
                    }.padding(.vertical, -20)
                        .padding(.horizontal, 25)
                }
                
                VStack {
                    HStack {
                        Spacer()
                        Text("Toplam:\n\(totalPrice, specifier: "%.2f") TL")
                            .font(.custom("Roboto-Bold", size: 24))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        
                        VStack {
                            Spacer()
                            Button(action: {
                                showCart = true
                                selectedPizza = pizzas[currentIndex % pizzas.count]
                            }) {
                                Text("Sepete Ekle")
                                    .font(.custom("Roboto-Regular", size: 24))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 30)
                                    .padding(.vertical, 10)
                                    .background(.green)
                                    .cornerRadius(10)
                                    .shadow(color: .gray, radius: 5, x: 2, y: 2)
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                    .background(Color(red: 19/255, green: 72/255, blue: 140/255).opacity(0.8))
                }
                .frame(height: UIScreen.main.bounds.height/10)
            }
            .navigationBarItems(trailing:
                                    NavigationLink(destination: CartView(selectedPizza: selectedPizza, totalPrice: totalPrice), isActive: $showCart) {
                Image(systemName: "cart")
                    .foregroundColor(.red)
                    .font(.system(size: 24))
            }
            )
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    func clearExtraIngredients() {
        selectedExtraIngredients = Array(repeating: false, count: extraIngredients.count)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}


