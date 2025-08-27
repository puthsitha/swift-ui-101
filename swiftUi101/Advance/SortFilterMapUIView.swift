//
//  SortFilterMapUIView.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 26/8/25.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let point: Int
    let isVerified: Bool
    
    init(name: String?, point: Int, isVerified: Bool = false) {
        self.name = name
        self.point = point
        self.isVerified = isVerified
    }
}

class UserManager: ObservableObject {
    @Published var userData: [UserModel] = []
    @Published var filterUserData: [UserModel] = []
    @Published var mapUserName: [String] = []
    
    init() {
        getUsers()
    }
    
    func getUsers() {
        for index in 0..<20 {
            let user = UserModel(name: "User \(index + 1)", point: index + 1, isVerified: index % 2 == 0 ? true : false)
            userData.append(user)
        }
    }
    
    func filterUsers(){
        filterUserData = userData.filter({$0.isVerified})
    }
    
    func sortUsers(){
        filterUserData = userData.sorted(by: { $0.point > $1.point})
    }
    
    func mapUsersName(){
        // use compactMap for option type
        // use map for not option type
        
        mapUserName = userData.compactMap({ $0.name })
    }
}

enum SelectOption: String, CaseIterable, Identifiable {
    case all
    case filter
    case sort
    case map
    
    var id: String { self.rawValue }
}

struct SortFilterMapUIView: View {
    @StateObject private var vm = UserManager()
    @State private var selectOption: SelectOption = .all
    
    var body: some View {
        VStack {
            Picker("Operation", selection: $selectOption) {
                ForEach(SelectOption.allCases) { option in
                    Text(option.rawValue.capitalized).tag(option)
                }
            }
            .pickerStyle(.segmented)
        }
        .onChange(of: selectOption) { oldValue, newValue in
            handleSelection(newValue)
        }
        .padding()
        
        
        ScrollView(showsIndicators: false){
            VStack(spacing: 20){
                
                if selectOption == .map {
                    ForEach(vm.mapUserName, id: \.self){ userName in
                        VStack {
                            Text(userName)
                                .font(.headline)
                        }
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: .black.opacity(0.3), radius: 2)
                        .padding(.horizontal)
                    }
            }else{
                ForEach(selectOption == .all ? vm.userData : vm.filterUserData) { user in
                    HStack{
                        VStack(alignment: .leading ,spacing: 5){
                            Text(user.name ?? "N/A")
                                .font(.headline)
                            Text("\(user.point) points")
                                .font(.subheadline)
                        }
                        Spacer()
                        if (user.isVerified){
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.blue)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .black.opacity(0.3), radius: 2)
                    .padding(.horizontal)
                }
            }
        }
            .padding(.top)
        }
    }
    
    private func handleSelection(_ option: SelectOption) {
            switch option {
            case .all:
                showAll()
            case .filter:
                applyFilter()
            case .sort:
                applySort()
            case .map:
                applyMap()
            }
        }
        
        private func showAll() {
            // logic for all
        }
        
        private func applyFilter() {
            vm.filterUsers()
        }
        
        private func applySort() {
            vm.sortUsers()
        }
        
        private func applyMap() {
            vm.mapUsersName()
        }
}

#Preview {
    SortFilterMapUIView()
}
