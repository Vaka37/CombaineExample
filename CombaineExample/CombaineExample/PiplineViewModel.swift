//
//  PiplineViewModel.swift
//  CombaineExample
//
//  Created by Vakil on 21.05.2024.
//

///"✅"
///"🚫"

import Foundation
import Combine
import UIKit

extension Notification.Name {
    static let event = Notification.Name("signal")
}

final class PiplineViewModel: ObservableObject {
    @Published var data: String? = ""
    @Published var status: String? = ""
    private  var cancellable: AnyCancellable?
    
    init() {
        cancellable = $data
            .map { [unowned self] value -> String in
                status = "Ищем авто"
                return value ?? ""
            }
            .delay(for: 7, scheduler: DispatchQueue.main)
            .sink { [unowned self] value  in
                data = "через 10 Мин подъедет"
                self.status = "Toyota Camry г/н В008ак37"
            }
    }
    
    func refresh() {
        data = "Снова Ищем"
    }
    
    func cancel() {
        status = "Операция отменена"
        status = ""
        cancellable?.cancel()
        cancellable = nil
    }
}
