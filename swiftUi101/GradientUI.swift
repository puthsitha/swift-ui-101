//
//  GradientUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 4/8/25.
//

import SwiftUI

struct GradientUI: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(
//                Color.blue,
//                LinearGradient(
//                    gradient: Gradient(colors: [Color.red, Color.blue]),
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing
//                )
//                RadialGradient(
//                    gradient: Gradient(colors: [Color.red, Color.blue]),
//                    center: .topLeading,
//                    startRadius: 5,
//                    endRadius: 400)
                AngularGradient(
                    gradient: Gradient(colors: [Color.red, Color.blue]),
                    center: .topLeading,
                    angle: Angle(degrees: 180+24)
                 )
            )
            .frame(width: 300, height: 200)
    }
}

#Preview {
    GradientUI()
}
