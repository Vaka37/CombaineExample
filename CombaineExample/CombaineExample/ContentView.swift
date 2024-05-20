//
//  ContentView.swift
//  CombaineExample
//
//  Created by Vakil on 20.05.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        VStack {
            HStack{
                TextField("Ваше имя", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text(viewModel.validation)
            }
            HStack{
                TextField("password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text(viewModel.validationPassword)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
