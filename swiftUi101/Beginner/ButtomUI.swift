//
//  ButtomUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 6/8/25.
//

import SwiftUI

struct ButtomUI: View {
    @State var text:String = "This is the text!"
    @State var bgColor:Color = Color.green
    
    var body: some View {
        ZStack {
            bgColor.ignoresSafeArea()
            
            ContentBodyView(text: $text, bgColor: $bgColor)
        }
    }
}

struct ContentBodyView: View{
    
    @Binding var text: String
    @Binding var bgColor : Color
    
    var body: some View{
        VStack {
            Text(text)
                .bold()
                .font(.largeTitle)
                .foregroundStyle(Color.white)
            
            CustomActionButton(title: "change text") {
                changeRamdomText()
            }
            
            CustomActionButton(title: "change background color", backgroundColor: .green, iconName: "paintbrush") {
                changeRamdomBgColor()
            }
        }
    }
    
    func changeRamdomBgColor(){
        let colorOptions: [Color] = [
                .red, .green, .orange, .purple, .pink, .cyan, .mint, .brown
            ]
        
        bgColor = colorOptions.randomElement() ?? .gray
    }
    
    func changeRamdomText(){
        let textOptions = [
                "Welcome to SwiftUI!",
                "Hello, World!",
                "Text has changed!",
                "Another message!",
                "Random text shown!"
            ]
        
        text = textOptions.randomElement() ?? "Default text"
    }
}

struct CustomActionButton: View {
    var title: String
    var backgroundColor: Color = .blue
    var iconName: String = "chevron.right"
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title.capitalized)
                Spacer()
                Image(systemName: iconName)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
            .foregroundColor(.white)
        }
        .padding(.horizontal)
        .buttonStyle(PressableButtonStyle())
    }
}

struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.6 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
    }
}


#Preview {
    ButtomUI()
}
