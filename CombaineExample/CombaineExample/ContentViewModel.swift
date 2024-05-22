//
//  ContentViewModel.swift
//  CombaineExample
//
//  Created by Vakil on 20.05.2024.
//

import Foundation
import Combine
import UIKit

extension Notification.Name {
    static let event = Notification.Name("signal")
}

struct People {
    let name: String
}

let label = UILabel()
let namePublisher = NotificationCenter
    .Publisher(center: .default, name: .event)
    .map{($0.object as? People)?.name}

let nameSubscruiber = Subscribers
    .Assign(object: label, keyPath: \.text)

//namePublisher.subscribe(nameSubscruiber)

let people = People(name: "Vaka")

//NotificationCenter.default.post(name: .event, object: people)
//print(String(describing: label.text))


