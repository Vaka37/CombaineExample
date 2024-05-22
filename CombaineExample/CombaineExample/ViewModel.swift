//
//  ViewModel.swift
//  CombaineExample
//
//  Created by Vakil on 22.05.2024.
//

import Foundation
import Combine

final class ViewModel: ObservableObject {
    var inputText = CurrentValueSubject<String, Never>("")
    var numbers: [String] = []
    var cancellable: AnyCancellable?
    var isHiddenButton = CurrentValueSubject<Bool, Never>(true)

    init() {
        cancellable = inputText
            .sink { [unowned self] item in
                isHiddenButton.value = inputText.value.isEmpty ? true : false
                objectWillChange.send()
            }
    }

    func addNumber() {
        _ = inputText
            .flatMap{ item -> AnyPublisher<String, Never> in
                if !item.isEmpty  {
                    return Just(item)
                        .eraseToAnyPublisher()
                } else {
                    return Empty(completeImmediately: true)
                        .eraseToAnyPublisher()
                }
            }
            
            .sink{ [unowned self] item in
                inputText.value = ""
                numbers.append(item)
                objectWillChange.send()
            }
            
    }
    
    func removeAll() {
        inputText.value = ""
        numbers = []
        objectWillChange.send()
    }
}
