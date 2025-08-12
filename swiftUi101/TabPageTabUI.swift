//
//  TabPageTabUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 12/8/25.
//

import SwiftUI

struct TabPageTabUI: View {
    @State private var selectedTab = "home"
    
    var body: some View {
        
//       Bottom Tab View
//        TabView(selection: $selectedTab){
//            Tab("Home", systemImage: "house", value: "home") {
//                HomeView()
//            }
//            Tab("Profile", systemImage: "person", value: "profile") {
//                ProfileView()
//            }
//        }
        
//        PageTab View
        TabView{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.green)
        }
        .frame(height: 300)
        .padding()
        .tabViewStyle(PageTabViewStyle())
    }
}

struct HomeView: View {
    var body: some View {
        Text("Home Page")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile Page")
    }
}

#Preview {
    TabPageTabUI()
}
