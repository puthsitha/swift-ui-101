//
//  PickerUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 10/8/25.
//

import SwiftUI

struct PickerUI: View {
    @State private var selectFilter: String = "most popular"
    private let filterOptions = ["most popular", "recently watch", "top rating", "up coming"]
    
    // state for color picker
    @State var bgColor: Color = Color.red
        
//    state for date picker
    @State var selectDate: Date = Date()
    let startDate:Date = Calendar.current.date(from: DateComponents(year: 2019)) ?? Date()
    let endDate: Date = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
//        Picker(selection: $selectFilter) {
//            ForEach(filterOptions, id: \.self) { option in
//                Text(option).tag(option)
//            }
//        } label: {
//            HStack {
//                Text("Filter")
//                Text(selectFilter)
//            }
//            .font(.headline)
//            .padding()
//            .padding(.horizontal)
//            .background(Color.blue)
//            .foregroundStyle(Color.white)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//        }
//        .pickerStyle(.inline)
//        .pickerStyle(.automatic)
//        .pickerStyle(.menu)
//        .pickerStyle(.navigationLink)
//        .pickerStyle(.palette)
//        .pickerStyle(.segmented)
//        .pickerStyle(.wheel)
        
//         Color Picker
//        ZStack{
//            bgColor.ignoresSafeArea()
//            
//            ColorPicker(
//                "Please select color",
//                selection: $bgColor,
//                supportsOpacity: true
//            )
//            .padding()
//            .background(Color.gray)
//            .foregroundStyle(Color.white)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .padding(.horizontal)
//        }
        
//        Date Picker
        VStack {
            Text(dateFormatter.string(from: selectDate))
                .font(.title)
            
            DatePicker(
                "Select Date",
                selection: $selectDate,
                in: startDate...endDate,
                displayedComponents: [.date, .hourAndMinute],
            )
            .padding()
            .padding(.horizontal)
            .tint(Color.red)
            .datePickerStyle(
                CompactDatePickerStyle()
                //                GraphicalDatePickerStyle()
                //                WheelDatePickerStyle()
            )
        }
    }
}

#Preview {
    PickerUI()
}
