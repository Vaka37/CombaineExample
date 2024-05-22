//
//  ContentView.swift
//  CombaineExample
//
//  Created by Vakil on 20.05.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CancellingMultiplePipelinesViewModel()
    var body: some View {
        Group {
            HStack{
                TextField("Name", text: $viewModel.firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text(viewModel.firstNameValidation)
            }
            HStack{
                TextField("lastName", text: $viewModel.lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text(viewModel.lastNameValidation)
            }
        }
        .padding()
        
        Button("Cancel") {
            viewModel.cancelAllValidations()
        }
    }
}

#Preview {
    ContentView()
}
