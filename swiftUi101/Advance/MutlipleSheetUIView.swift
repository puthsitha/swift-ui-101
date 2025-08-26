//
//  MutlipleSheetUIView.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 26/8/25.
//

import SwiftUI

/*
 There are three way to perform the multi sheet
 
  - binding
  - mutiple sheet
  - content $item
 
 */

struct SheetModel: Identifiable {
    let id = UUID().uuidString
    let tittle: String
}

struct MutlipleSheetUIView: View {
    
    @State var sheetModel: SheetModel?
    
    var body: some View {
        
        ScrollView(showsIndicators: false){
            VStack{
                ForEach(0..<30) { index in
                    Button("Open toggle \(index)"){
                        sheetModel = SheetModel(tittle: String(index))
                    }
                    .padding()
                }
            }.sheet(item: $sheetModel) { sheet in
                ShowSheetModalUIView(sheetModel: sheet)
            }
        }
    }
}

struct ShowSheetModalUIView: View {
    
    let sheetModel: SheetModel
    
    var body: some View {
        Text("Sheet title : \(sheetModel.tittle)")
    }
}

#Preview {
    MutlipleSheetUIView()
}
