//
//  TransactionUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 6/8/25.
//

import SwiftUI

struct TransactionUI: View {
    @State private var showShap: Bool = false

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button {
                    withAnimation(.easeInOut) {
                        toggleShap()
                    }
                } label: {
                    Text("toggle change, here!".capitalized)
                        .font(.headline)
                }
                Spacer()
            }

            if showShap {
                Rectangle()
                    .fill(Color.green)
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                    .cornerRadius(10)
//                    .transition(.slide)
//                    .transition(.move(edge: .bottom))
//                    .transition(.scale)
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .leading),
                            removal: .move(edge: .bottom)
                        )
                    )
//                    .animation(.easeInOut, value: showShap)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }

    func toggleShap() {
        showShap.toggle()
    }
}

#Preview {
    TransactionUI()
}
