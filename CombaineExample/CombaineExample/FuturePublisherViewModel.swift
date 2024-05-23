//
//  FuturePublisherViewModel.swift
//  CombaineExample
//
//  Created by Vakil on 23.05.2024.
//

import Foundation
import Combine

class FuturePublisherViewModel: ObservableObject {
    @Published var firstResult = ""
    var cancelable: AnyCancellable?
    
    func createFetch(url: URL) -> AnyPublisher<String?, Error> {
        Future {promise in
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    promise(.failure(error))
                    return
                }
                promise(.success(response?.url?.absoluteString ?? ""))
            }
            task.resume()
        }
        .eraseToAnyPublisher()
    }
    
    func fetch() {
        guard let url = URL(string: "https://yandex.ru") else { return }
        cancelable = createFetch(url: url)
            .receive(on: RunLoop.main)
            .sink { complition in
                print(complition)
            } receiveValue: { [unowned self] value in
                firstResult = value ?? ""
            }
    }
}
