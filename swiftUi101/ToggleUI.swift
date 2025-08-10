//
//  ToggleUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 10/8/25.
//

import SwiftUI

struct ToggleUI: View {
    @State var isOpen: Bool = false
    
    var body: some View {
        VStack (spacing: 30){
            HStack {
                Text("Shop status : ")
                Text(isOpen ? "Open" : "Close")
                    .foregroundStyle(isOpen ? .green : .red)
            }
            .font(.title)
            
            Toggle(isOn: $isOpen) {
                Text("Change Status")
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ToggleUI()
}
