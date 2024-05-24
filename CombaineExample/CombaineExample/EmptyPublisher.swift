//
//  EmptyPublisher.swift
//  CombaineExample
//
//  Created by Vakil on 22.05.2024.
//

import SwiftUI

struct EmptyPublisher: View {
    @ObservedObject private var viewModel = ViewModel()
    var body: some View {
        VStack {
            TextField("ВВедите шонито", text: $viewModel.inputText.value)
            HStack {
                Button("Добавить текст") {
                    viewModel.addNumber()
                }
                .disabled(viewModel.isHiddenButton.value)
                Divider()
                Button("Очистить текст") {
                    viewModel.removeAll()
                }.tint(.red)
            }
            .frame(height: 70)
            
            List(viewModel.numbers, id: \.self) { item in
                Text(item)
            }.font(.title)
        }
        .padding()
    }
}

#Preview {
    EmptyPublisher()
}
