//
//  ImageUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 4/8/25.
//

import SwiftUI

struct ImageUI: View {
    var body: some View {
//        Image("google")
        Image("image")
//            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 300)
            .cornerRadius(20)
            .clipShape(
                Circle()
//                Ellipse()
            )
//            .foregroundColor(Color.green)
    }
}

#Preview {
    ImageUI()
}
