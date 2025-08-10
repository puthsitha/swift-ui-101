//
//  ActionSheetUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 9/8/25.
//

import SwiftUI

struct ActionSheetUI: View {
    @State var showActionSheet: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing,){
            Image("image")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(Color.red, lineWidth: 4)
                }
            
            Button {
                showActionSheet.toggle()
            } label: {
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 30)
                    .overlay {
                        Image(systemName: "pencil.line")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .bold))
                    }
            }
        }
        .confirmationDialog(
            "Change Photo",
            isPresented: $showActionSheet,
            titleVisibility: .visible,
        ) {
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
    ActionSheetUI()
}
