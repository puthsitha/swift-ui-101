//
//  StepSliderUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 10/8/25.
//

import SwiftUI

struct StepSliderUI: View {
    @State var stepValue: CGFloat = 10
    @State var width: CGFloat = 100
    @State var sliderValue: Double = 10
    
    var body: some View {
//        Stepper
        Stepper("Amount : \(String(format: "%.f", stepValue))", value: $stepValue)
            .padding()
        
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.red)
            .frame(width: width, height: 100)
        
        Stepper("Wid: \(String(format: "%.2f", width))") {
            increaseWidth(amount: stepValue)
        } onDecrement: {
            decreaseWidth(amount: stepValue)
        }
        .padding()

//        Slider
        VStack{
            Text("Rating : \(String(format: "%.2f", sliderValue))")
                .padding()
            
            Slider(
                value: $sliderValue,
                in: 0...10,
                step: 1,
                label: {
                    Text("Rating")
                },
                minimumValueLabel: {
                    Text("0")
                },
                maximumValueLabel: {
                    Text("10")
                }
            )
                .padding()
                .tint(Color.red)
        }
    }
    
    private func increaseWidth(amount : CGFloat){
        withAnimation(.easeInOut){
            width += amount
        }
    }
    private func decreaseWidth(amount : CGFloat){
        withAnimation(.easeInOut){
            width -= amount
        }
    }
}

#Preview {
    StepSliderUI()
}
