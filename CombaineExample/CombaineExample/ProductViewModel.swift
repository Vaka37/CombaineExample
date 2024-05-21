//
//  ProductViewModel.swift
//  CombaineExample
//
//  Created by Vakil on 21.05.2024.
//

import Combine
import Foundation

struct Product {
    let id = UUID()
    let name: String
    let price: Int
}

final class ProductViewModel: ObservableObject {
    @Published var price = 0
    @Published var products: [Product] = [
        .init(name: "Bred", price: 10),
        .init(name: "maslo", price: 20),
        .init(name: "Krupa", price: 30),
        .init(name: "konfety", price: 40),
        .init(name: "perec", price: 55),
        .init(name: "moloko", price: 2300)
    ]
    
    @Published var cart: [Product] = []
    @Published var lastItem: Product?
    
    var anyCancellable: AnyCancellable?
    
    init() {
        anyCancellable = $lastItem
            .filter { $0?.price ?? 0 < 1000 }
            .sink { [unowned self] product in
                guard let product else { return }
                cart.append(product)
                sumTotal()
            }
    }
    
    func sumTotal() {
        _ = cart.publisher
            .scan(100) { $0 + $1.price }
            .sink { [unowned self] price in
                self.price = price
            }
    }
    
    func addToСart(_ product: Product) {
        lastItem = product
    }

    func removePrice(_ price: Int) {
        self.price -= price
    }
    
    func removeProduct(_ product: Product) {
        if let index = cart.lastIndex(where: { $0.id == product.id }) {
            cart.remove(at: index)
            removePrice(product.price)
        }
    }
}

