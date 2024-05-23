//
//  FailPublisherViewModel.swift
//  CombaineExample
//
//  Created by Vakil on 22.05.2024.
//

import Foundation
import Combine

class FailPublisherViewModel: ObservableObject {
    @Published var text = ""
    @Published var age = 0
    @Published var error: InvalidAgeError?
    @Published var items: [Int] = []
    
    func save() {
        _ = validationPublisher(number: Int(text))
            .sink { [unowned self] complition in
                switch complition {
                case .failure(let error):
                    self.error = error
                case .finished:
                    break
                }
            } receiveValue: { [unowned self] value in
                
            }
    }
    
    func validationPublisher(number: Int?) -> AnyPublisher<Int, InvalidAgeError> {
        if let number = number {
            items.append(number)
            return Just(number)
                .setFailureType(to: InvalidAgeError.self)
                .eraseToAnyPublisher()
        } else {
            return Fail(error: InvalidAgeError.noNumber)
                .eraseToAnyPublisher()
        }
    }
    
    func removeAll() {
        items = []
        error = nil
    }
}

enum InvalidAgeError: String, Error, Identifiable {
    var id: String { rawValue }
    case noNumber = "Введенное значение не является числом."
}
