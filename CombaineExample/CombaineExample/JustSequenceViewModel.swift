//
//  JustSequenceViewModel.swift
//  CombaineExample
//
//  Created by Vakil on 23.05.2024.
//

import Foundation
import Combine

class JustSequenceViewModel: ObservableObject {
    @Published var dataToView: [String] = []
    
    var arrayFruites = ["Яблоко", "Банан", "Апельсин"]
    var arrayFruitesTwo = ["Фрукт 3", "Фрукт 4", "Фрукт 5"]
    
    func fetch() {
           Just(arrayFruites)
            .flatMap{ $0.publisher }
            .collect()
            .assign(to: &$dataToView)
    }
    
    func addFruit() {
        _ = arrayFruitesTwo.publisher
            .first()
            .sink(receiveCompletion: { completion in
            }, receiveValue: { [unowned self] value in
                dataToView.append(value)
                arrayFruitesTwo.removeFirst()
                return
            })
    }
    
    func deleteLastFruct() {
        dataToView.removeLast()
    }
}
