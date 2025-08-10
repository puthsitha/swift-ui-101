//
//  ContextMenuUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 9/8/25.
//

import SwiftUI

struct ContextMenuUI: View {
    var body: some View {
            HStack{
                Text("Hover to see the menu")
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding()
        .contextMenu {
            Button("Change Photo") {
                print("Change Photo tapped")
            }
            Button("Remove Photo", role: .destructive) {
                print("Remove Photo tapped")
            }
            Button("Cancel", role: .cancel) { }
        }
    }
}

#Preview {
    ContextMenuUI()
}
