//
//  ResultNumberView.swift
//  CombaineExample
//
//  Created by Vakil on 23.05.2024.
//

import SwiftUI

struct ResultNumberView: View {
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        VStack{
            TextField("Введите число", text: $viewModel.textField)
                .keyboardType(.numberPad)
            Button("Проверить простоту числа"){
                viewModel.fetch()
            }
            .padding()
            Text(viewModel.result)
        }
        .padding()
    }
}

#Preview {
    ResultNumberView()
}
