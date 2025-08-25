//
//  GridUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 5/8/25.
//

import SwiftUI

struct GridUI: View {
    let columns:[GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]

  
        var body: some View {
            ScrollView{
                Rectangle()
                    .fill(Color.yellow)
                    .frame(height: 400)
                
                LazyVGrid(
                    columns: columns,
                    alignment: .center,
                    spacing: nil,
                    pinnedViews: [.sectionHeaders],
                    content: {
                        Section(header:
                                    Text("Section A")
                            .padding(.horizontal)
                            .font(.largeTitle)
                            .bold()
                            .frame(
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                            .background(Color.white)
                        ) {
                            ForEach(0..<50) { index in
                                Rectangle()
                                    .fill(Color.red)
                                    .frame(height: 50)
                            }
                        }
                        
                        Section(header:
                                    Text("Section B")
                            .padding(.horizontal)
                            .font(.largeTitle)
                            .bold()
                            .frame(
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                            .background(Color.white)
                        ) {
                            ForEach(0..<50) { index in
                                Rectangle()
                                    .fill(Color.red)
                                    .frame(height: 50)
                            }
                        }
                    }
                )
            }
        }
}

#Preview {
    GridUI()
}
