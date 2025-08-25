//
//  TextInputUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 10/8/25.
//

import SwiftUI

struct User {
    var name: String
    var bio: String
}

struct TextInputUI: View {
    @State var userName: String = ""
    @State var userBio: String = ""
    
    @State var userData: [User] = []
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16){
                TextField("Your name here ...", text: $userName)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundStyle(.primary)
                    .font(.headline)
                
                    TextEditor(text: $userBio)
                        .colorMultiply(Color.gray.opacity(0.3))
                        .frame(height: 100)
                        .lineSpacing(5)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                

                Button {
                    if validateInput() {
                        addUser()
                    }
                } label: {
                    Text("SAVE")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .background(validateInput() ? Color.blue : Color.gray)
                        .foregroundStyle(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .disabled(validateInput() ? false : true)
                
                List(userData, id: \.name) { user in
                    VStack(alignment: .leading) {
                        Text(user.name).font(.headline)
                        Text(user.bio).font(.subheadline).foregroundStyle(.secondary)
                    }
                }

                Spacer()
            }
            .padding()
            .navigationTitle("User input")
        }
    }
    
    private func validateInput() -> Bool {
        return !userName.isEmpty && userBio.count >= 6
    }
    
    private func addUser() {
            let newUser = User(name: userName, bio: userBio)
            userData.append(newUser)
            userName = ""
            userBio = ""
        }
}

#Preview {
    TextInputUI()
}
