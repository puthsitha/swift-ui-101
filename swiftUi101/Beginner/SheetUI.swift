//
//  SheetUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 7/8/25.
//

import SwiftUI

struct SheetUI: View {
    @State var showSheet = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.red.ignoresSafeArea()
            
            VStack{
                Button("show sheet") {
                    showSheet = true
                }
                .font(.largeTitle)
                
                Spacer()
            }
//            Method 1 using sheet
            // full Sheet
//            .fullScreenCover(
//                isPresented: $showSheet,
//                             content: {
//                SheetModal()
//            })
//            .sheet(
//                isPresented: $showSheet,
//                             content: {
//                SheetModal()
//            })
            
//            Method 2 using transition
//            ZStack{
//                if showSheet {
//                    SheetModal(showSheet: $showSheet)
//                        .padding(.top, 100)
//                        .transition(.move(edge: .bottom))
////                        .animation(.spring, value: showSheet)
//                }
//            }.zIndex(9)
            
//            Method 3 animation
            SheetModal(showSheet: $showSheet)
                .padding(.top, 100)
                .offset(y: showSheet ? 0 : UIScreen.main.bounds.height)
                .animation(.spring(), value: showSheet)
        }
    }
}

struct SheetModal: View {
    @Environment(\.dismiss) var dismiss
    @Binding var showSheet: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.yellow.ignoresSafeArea()
            
            Button {
//                dismiss()
//                withAnimation(.spring){
                    showSheet.toggle()
//                }
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(Color.white)
                    .padding()
                    .font(.largeTitle)
            }

        }
    }
}

#Preview {
    SheetUI()
}
