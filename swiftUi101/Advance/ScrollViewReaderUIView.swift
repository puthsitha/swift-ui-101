//
//  ScrollViewReaderUIView.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 26/8/25.
//

import SwiftUI

struct ScrollViewReaderUIView: View {
    @State var scrollIndex : Int = 0
    @State var textInput: String = ""
    
    var body: some View {
        TextField("change index here ...", text: $textInput)
            .frame(height: 50)
            .padding(.horizontal)
            .textFieldStyle(.plain)
            .border(.gray,)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal)
            .keyboardType(.numberPad)
        
        Button("Scrolling to index"){
            withAnimation(.spring()){
                if let index = Int(textInput) {
                    scrollIndex = index
                }
            }
            textInput = ""
        }
        
        ScrollView(showsIndicators: false){
            ScrollViewReader { proxy in
                ForEach(0..<30) { index in
                    Text("Index \(index + 1)")
                        .font(.title)
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: .black.opacity(0.3), radius: 10)
                        .padding(.top)
                        .padding(.horizontal)
                        .id(index)
                }
                .onChange(of: scrollIndex) { _, newValue in
                    withAnimation(.spring()) {
                        proxy.scrollTo(newValue, anchor: .center)
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaderUIView()
}
