//
//  HasableUIView.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 26/8/25.
//

import SwiftUI

struct RamdomModel:Hashable {
    let tittle: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(tittle)
    }
}

struct HasableUIView: View {
    let data: [RamdomModel] = [
        RamdomModel(tittle: "First"),
        RamdomModel(tittle: "Second"),
        RamdomModel(tittle: "Third")
    ]
    var body: some View {
        VStack(spacing: 20){
            ForEach(data, id: \.self) { item in
                Text(item.hashValue.description)
                    .font(.headline)
            }
        }
    }
}

#Preview {
    HasableUIView()
}
