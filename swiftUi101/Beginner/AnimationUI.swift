//
//  AnimationUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 6/8/25.
//

import SwiftUI

struct AnimationUI: View {
    @State var isCircle: Bool = false
    
    var body: some View {
        VStack(spacing: 20){
            Rectangle()
                .fill(isCircle ? Color.green : Color.red)
                .frame(
                    width: 200,
                    height: 200,
                )
                .cornerRadius(isCircle ? 200/2 : 10)
                .animation(
//                    .linear,
//                    .default,
//                    .easeIn,
//                    .easeOut,
//                    .easeInOut(duration: 1.0).repeatCount(3),
                    .spring(
                        response: 0.5,
                        dampingFraction: 0.5,
                        blendDuration: 1,
                    ),
                    value: isCircle
                )
            
            Button {
                toggleShap()
            } label: {
                Text("toggle change, here!".capitalized)
                    .font(.headline)
            }

        }
    }
    
    func toggleShap(){
            isCircle.toggle()
    }
}

#Preview {
    AnimationUI()
}
