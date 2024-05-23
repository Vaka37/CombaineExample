//
//  ContentView.swift
//  CombaineExample
//
//  Created by Vakil on 20.05.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = FuturePublisherViewModel()
    var body: some View {
        VStack {
            Text(viewModel.firstResult)
            Button("Запуск") {
                viewModel.fetch()
            }
        }
        .padding()
        .onAppear() {
            viewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
