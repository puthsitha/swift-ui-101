//
//  NavigationUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 7/8/25.
//

import SwiftUI

struct NavigationUI: View {
    var body: some View {
        NavigationStack {
                    List {
                        NavigationLink("Go to Detail", value: "Hello from Home")
                    }
                    .navigationTitle("Home")
                    .navigationDestination(for: String.self) { value in
                        DetailView(message: value)
                    }
                }
    }
}

struct DetailView: View {
    let message: String
    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
            NavigationLink("Go deeper", value: "You are deeper now!")
        }
        .navigationTitle("Detail")
    }
}

#Preview {
    NavigationUI()
}
