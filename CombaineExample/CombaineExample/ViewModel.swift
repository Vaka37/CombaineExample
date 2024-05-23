//
//  ViewModel.swift
//  CombaineExample
//
//  Created by Vakil on 23.05.2024.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var textField = ""
    @Published var result = ""
    
    func validateNumber() -> AnyPublisher<String, Never> {
        Deferred {
            Future<String, Never> { promise in
                if let number = Int(self.textField){
                    if number > 1 && !(2..<number).contains(where: { number % $0 == 0 }){
                        promise(.success("простое число"))
                    } else {
                        promise(.success("Не простое число"))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func fetch() {
        _ = validateNumber()
            .sink { complition in
                self.result = complition
            }
    }
}
