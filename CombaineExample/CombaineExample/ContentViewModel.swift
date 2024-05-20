//
//  ContentViewModel.swift
//  CombaineExample
//
//  Created by Vakil on 20.05.2024.
//
///"✅"
///"🚫"

import Foundation
import Combine

final class ContentViewModel: ObservableObject {
    @Published var name = ""
    @Published var validation = ""
    @Published var password = ""
    @Published var validationPassword = ""
    
    init() {
        $name
            .map { $0.isEmpty ? "🚫" : "✅" }
            .assign(to: &$validation)
        
        $password
            .map { $0.isEmpty ? "🚫" : "✅" }
            .assign(to: &$validationPassword)

    }
}
