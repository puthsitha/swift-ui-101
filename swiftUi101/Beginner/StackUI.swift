//
//  StackUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 5/8/25.
//

import SwiftUI

struct StackUI: View {
    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
            Rectangle()
                .fill(Color.green)
                .frame(width: 200, height: 100)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 300, height: 100)
        })
        
        HStack(alignment: .center, spacing: nil, content: {
            Circle()
                .fill(Color.red)
                .frame(height: 100)
            Circle()
                .fill(Color.yellow)
                .frame(height: 150)
            Circle()
                .fill(Color.green)
                .frame(height: 200)
        })
        .padding(.horizontal)
        
        ZStack(alignment: .center) {
            Ellipse()
                .fill(Color.red)
                .padding(.all)
            Ellipse()
                .fill(Color.yellow)
                .frame(width: 300)
                .padding(.vertical)
            Ellipse()
                .fill(Color.green)
                .frame(width: 200)
                .padding(.vertical)
            
        }
    }
}

#Preview {
    StackUI()
}
