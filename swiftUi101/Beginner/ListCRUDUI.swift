//
//  ListCRUDUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 7/8/25.
//

import SwiftUI

struct ListCRUDUI: View {
    @State var  languages: [String] = ["c++", "php", "java", "javascript"]
    @State var  frameworks: [String] = ["go", "laravel", "spring bot", "react js"]
    
    var body: some View {
        NavigationStack {
            List{
                Section {
                    ForEach(languages, id: \.self) { language in
                        Text(language.capitalized)
                    }
                    .onDelete(perform: deleteLanguage)
//                    .onMove(perform: moveLanguage)
                    .onMove { IndexSet, Int in
                        print(IndexSet)
                        print(Int)
                    }
                } header: {
                    HStack {
                        Text("Languages")
                        Spacer()
                        Image(systemName: "medal")
                    }
                    .foregroundStyle(Color.green)
                }
                Section {
                    ForEach(frameworks, id: \.self) { framework in
                        Text(framework.capitalized)
                    }
                } header: {
                    HStack {
                        Text("Framwork")
                        Spacer()
                        Image(systemName: "timelapse")
                    }
                    .foregroundStyle(Color.yellow)
                }
            }
//            .listStyle(DefaultListStyle())
//            .listStyle(GroupedListStyle())
//            .listStyle(InsetListStyle())
            .listStyle(SidebarListStyle())
            .navigationTitle("Learning Code")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .tint(.red)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    addButton
                        .tint(.purple)
                }
            }
        }
    }
    
    var addButton: some View{
        Button("Add") {
            addLanguage()
        }
    }
    
    func deleteLanguage(index : IndexSet){
        print("source : \(index)")
        languages.remove(atOffsets: index)
    }
    
    func moveLanguage(from source: IndexSet, to destination: Int) {
        print("source : \(source)")
        languages.move(fromOffsets: source, toOffset: destination)
    }
    
    func addLanguage(){
        languages.append("C#")
    }
}

struct ContentExampleView: View {
    @State private var users = ["Paul", "Taylor", "Adele"]

        var body: some View {
            NavigationStack {
                List {
                    ForEach(users, id: \.self) { user in
                        Text(user)
                    }
                    .onMove(perform: move)
                }
                .toolbar {
                    EditButton()
                }
            }
        }

        func move(from source: IndexSet, to destination: Int) {
            users.move(fromOffsets: source, toOffset: destination)
        }
}

#Preview {
    ListCRUDUI()
//    ContentExampleView()
}
