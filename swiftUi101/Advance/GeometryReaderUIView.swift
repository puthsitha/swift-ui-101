//
//  GeometryReaderUIView.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 26/8/25.
//

import SwiftUI

struct GeometryReaderUIView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(0..<20) { index in
                    GeometryReader { geometery in
                        RoundedRectangle(cornerRadius: 10)
                            .rotation3DEffect(Angle(degrees: getPercentage(geo: geometery) * 10), axis: (x: 0, y: 10, z: 0))
                    }
                    .frame(width: 300, height: 200)
                    .padding(.leading)
                }
            }
        }
    }
    
    func getPercentage (geo: GeometryProxy) -> Double{
        let max = UIScreen.main.bounds.width / 2
        let current = geo.frame(in: .global).midX
        
        return Double(1 - (current/max))
    }
}

#Preview {
    GeometryReaderUIView()
}
