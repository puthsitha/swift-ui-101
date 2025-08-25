//
//  ShapUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 4/8/25.
//

import SwiftUI

struct ShapUI: View {
    var body: some View {
//        Circle()
//        Ellipse()
//        Rectangle()
        RoundedRectangle(cornerRadius: 20)
        
//        .fill(Color.red)
//        .foregroundColor(Color.green)
//            .stroke(Color.orange, lineWidth: 10)
//            .stroke(Color.blue, style: StrokeStyle(
//                lineWidth: 10,
//                lineCap: .round,
//                dash: [30]
//            ))
//            .trim(from: 0.5, to: 1.0)
//            .fill(Color(UIColor.secondarySystemBackground))
            .fill(Color("CustomColor"))
            .shadow(color: Color("CustomColor").opacity(0.3), radius: 20, x: 0, y: 0)
            .frame(width: 200, height: 150)
        
    }
}

#Preview {
    ShapUI()
}
