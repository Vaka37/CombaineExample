//
//  ContentView.swift
//  CombaineExample
//
//  Created by Vakil on 20.05.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = FailPublisherViewModel()
    var body: some View {
        VStack {
            if let error = viewModel.error?.rawValue {
                Text(error)
                    .font(.title)
                    .foregroundColor(.green)
                    .padding()
            }
            TextField("Введите число", text: $viewModel.text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()
            HStack {
                Button("Добавить") {
                    viewModel.save()
                }
                
                Button("Очистить список") {
                    viewModel.removeAll()
                }
            }
            List(viewModel.items, id: \.self){ item in
            Text("\(item)")
            }
        }

    }
}

#Preview {
    ContentView()
}
