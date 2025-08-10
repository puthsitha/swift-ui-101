//
//  ScrollViewUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 5/8/25.
//

import SwiftUI

struct ScrollViewUI: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            LazyVStack{
                ForEach(0..<100) { index in
                    ScrollView(.horizontal, showsIndicators: false ,content: {
                        LazyHStack{
                            ForEach(0..<20) { index in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .shadow(radius: 10)
                                    .frame(width: 200, height: 150)
                                    .padding()
                            }
                        }
                    })
                }
            }
        })
    }
}

#Preview {
    ScrollViewUI()
}
