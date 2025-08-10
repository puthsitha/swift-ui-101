//
//  FrameUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 4/8/25.
//

import SwiftUI

struct FrameUI: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .background(Color.red)
            .frame(width: 200, height: 100)
            .background(Color.blue)
            .frame(width: 300, height: 200, alignment: .leading)
            .background(Color.green)
            .frame(maxWidth: .infinity)
            .frame(height: 300, alignment: .bottom)
            .background(Color.pink)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(Color.purple)
    }
}

#Preview {
    FrameUI()
}
