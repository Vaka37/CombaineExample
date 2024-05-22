//
//  EmptyPublisherView.swift
//  CombaineExample
//
//  Created by Vakil on 22.05.2024.
//

import Foundation
import Combine

final class EmptyPublisherViewModel: ObservableObject {
    @Published var dataToView: [String] = []
    let  datas = ["Value 1", "Value 2", "Value 3", nil, "Value 5", "Value 6"]
    
    func fetch() {
        _ = datas.publisher
            .flatMap{ item -> AnyPublisher<String, Never> in
                if let item = item {
                    return Just(item)
                        .eraseToAnyPublisher()
                } else {
                    return Empty(completeImmediately: true)
                        .eraseToAnyPublisher()
                }
            }
            .sink{ [unowned self] item in
                dataToView.append(item)
            }
    }
}
