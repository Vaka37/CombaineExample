//
//  ContentView.swift
//  CombaineExample
//
//  Created by Vakil on 20.05.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = JustSequenceViewModel()
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Фрукты конкурса")) {
                    List(viewModel.dataToView, id: \.self) { item in
                        Text(item)
                    }
                }
            }
            HStack {
                Button("Added") {
                    viewModel.addFruit()
                }
                Button("delete") {
                    viewModel.deleteLastFruct()
                }
            }
        }
        .padding()
        .onAppear(){
            viewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
