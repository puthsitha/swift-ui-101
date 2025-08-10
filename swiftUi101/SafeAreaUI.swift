//
//  SafeAreaUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 6/8/25.
//

import SwiftUI

struct SafeAreaUI: View {
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea(.all)

            VStack {
                Text("Hello, World!")
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
        }
    }
}

#Preview {
    SafeAreaUI()
}
