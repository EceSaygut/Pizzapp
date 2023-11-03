//
//  CartView.swift
//  Pizzapp
//
//  Created by Ece Saygut on 20.06.2023.
//
import SwiftUI

struct CartView: View {
    var selectedPizza: Pizza?
    var totalPrice: Double
    @State private var cartItems: [Pizza] = []
    
    
    var body: some View {
        NavigationView {
            VStack {
                if cartItems.isEmpty {
                    Text("Sepetiniz boş.")
                        .font(.title)
                        .foregroundColor(.gray)
                } else {
                    List {
                        ForEach(cartItems, id: \.id) { pizza in
                            RowView(pizza: pizza, totalPrice: totalPrice)
                                .contextMenu {
                                    Button(action: {
                                        removeItem(pizza)
                                    }) {
                                        Label("Sil", systemImage: "trash")
                                    }
                                }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationBarTitle("Sepet")
            .padding()
            .onAppear {
                if let selectedPizza = selectedPizza {
                    addItem(selectedPizza)
                }
            }
        }
    }
    
    func addItem(_ pizza: Pizza) {
        cartItems.append(pizza)
    }
    
    func removeItem(_ pizza: Pizza) {
        if let index = cartItems.firstIndex(where: { $0.id == pizza.id }) {
            cartItems.remove(at: index)
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        cartItems.remove(atOffsets: offsets)
    }
}
