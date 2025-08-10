//
//  AlertUI.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 9/8/25.
//

import SwiftUI

struct AlertUI: View {
    @State var showAlert: Bool = false
    
    var body: some View {
            Button("Logout") {
                showAlert.toggle()
            }
            .alert(
                "Are you sure you want to logout?",
                isPresented: $showAlert,
                actions: {
                    Button("Cancel", role: .cancel) { }
                    Button("Logout", role: .destructive) {
                        performLogout()
                    }
                },
                message: {
                    Text("You will need to log in again to continue.")
                }
            )
        }
        
        private func performLogout() {
            print("User logged out")
        }
}

#Preview {
    AlertUI()
}
