//
//  IconUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 4/8/25.
//

import SwiftUI

struct IconUI: View {
    var body: some View {
        Image(
            systemName: "person.badge.plus"
        )
        .renderingMode(.original)
        .resizable()
//        .aspectRatio(contentMode: .fit)
//        .scaledToFit()
//        .scaledToFill()
//        .clipped()
//        .font(.title)
//        .font(.system(size: 24))
        .foregroundColor(Color.red)
        .frame(width: 200, height: 200)
         
    }
}

#Preview {
    IconUI()
}
