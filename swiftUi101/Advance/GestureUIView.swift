//
//  GestureUIView.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 25/8/25.
//

import SwiftUI

struct GestureUIView: View {
    
//    MARK: PROPERTIES
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    @State var currentValue: CGFloat = 0.0
    @State var angle: Angle = Angle(degrees: 0)
    @State var offset: CGSize = .zero
    
    var body: some View {
        //        MARK: LONG PRESS
        //        Group {
        //            Rectangle()
        //                .fill(isSuccess ? .green : .red)
        //                .frame(maxWidth: isComplete ? .infinity : 0)
        //                .frame(height: 35)
        //                .frame(maxWidth: .infinity, alignment: .leading)
        //                .background(.gray)
        //
        //            HStack(spacing: 20){
        //                Text("Long Press")
        //                    .font(.headline)
        //                    .padding()
        //                    .padding(.horizontal)
        //                    .foregroundStyle(.white)
        //                    .background(.blue)
        //                    .clipShape(RoundedRectangle(cornerRadius: 10))
        //                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50,
        //                        pressing: { isPressing in
        //                            if isPressing {
        //                                withAnimation(.easeInOut(duration: 1.0)) {
        //                                    isComplete = true
        //                                }
        //                            } else {
        //                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        //                                    if !isSuccess {
        //                                        isComplete = false
        //                                    }
        //                                }
        //                            }
        //                        },
        //                        perform: {
        //                            withAnimation(.easeIn) {
        //                                isSuccess = true
        //                            }
        //                        }
        //                    )
        //
        //
        //                Text("Reset")
        //                    .font(.headline)
        //                    .padding()
        //                    .padding(.horizontal)
        //                    .foregroundStyle(.white)
        //                    .background(.red)
        //                    .clipShape(RoundedRectangle(cornerRadius: 10))
        //                    .onTapGesture {
        //                        withAnimation(.smooth) {
        //                            isComplete = false
        //                            isSuccess = false
        //                        }
        //                    }
        //            }
        //        }
        
        //        MARK: MAGNIFICATION (ZOOM)
//        Group {
//            HStack(spacing: 10){
//                Circle()
//                    .frame(width: 35, height: 35)
//                Text("Puthsitha")
//                Spacer()
//                Image(systemName: "ellipsis")
//            }
//            .padding(.horizontal)
//            
//            Rectangle()
//                .fill(.custom)
//                .frame(height: 300)
//                .scaleEffect(max(0.9, 1 + currentValue))
//                .zIndex(currentValue > 0 ? 1 : 0)
//                .gesture(
//                    MagnificationGesture()
//                        .onChanged({ value in
//                            currentValue = value - 1
//                        })
//                        .onEnded({ value in
//                            withAnimation(.spring()) {
//                                currentValue = 0
//                            }
//                        })
//                )
//            
//        HStack(spacing: 10){
//                Image(systemName: "heart.fill")
//                Image(systemName: "text.bubble.fill")
//                Spacer()
//            }
//            .font(.headline)
//            .padding(.vertical, 5)
//            .padding(.horizontal)
//            
//            Text("This is the caption of the post in instragram!")
//                .font(.headline)
//                .padding(.horizontal)
//        }
        
//        MARK: ROTATION
//        Group{
//            Rectangle()
//                .fill(.custom)
//                .frame(width: 200 ,height: 300)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//                .rotationEffect(angle)
//                .gesture(
//                    RotateGesture()
//                        .onChanged({ value in
//                            angle = value.rotation
//                        })
//                        .onEnded({ value in
//                            withAnimation(.spring()) {
//                                angle = .zero
//                            }
//                        })
//                )
//        }
        
//        MARK: DRAG
        Group{
            Rectangle()
                .fill(
                    LinearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .frame(width: 300, height: 500)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .scaleEffect(getScaleAmong())
                .offset(offset)
                .rotationEffect(getRotationAmong())
                .gesture(
                    DragGesture()
                        .onChanged({ value in
//                            withAnimation(.spring()){
                                offset = value.translation
//                            }
                        })
                        .onEnded({ value in
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                        })
                )
        }
    }
    
    func getScaleAmong () -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAmong = abs(offset.width)
        let percent = currentAmong / max
        return 1 - min(percent, 0.5) * 0.5
    }
    
    func getRotationAmong () -> Angle {
        let max = UIScreen.main.bounds.width / 2
        let maxAngle:Double = 10
        let currentAmong = offset.width
        let percent = currentAmong/max
        return Angle(degrees: percent * maxAngle)
    }
}

#Preview {
    GestureUIView()
}
