//
//  ContentView.swift
//  CombaineExample
//
//  Created by Vakil on 20.05.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = EmptyPublisherViewModel()
    var body: some View {
        VStack(spacing: 20) {
            List(viewModel.dataToView, id: \.self) { item in
                Text(item)
            }
            .font(.title)
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
