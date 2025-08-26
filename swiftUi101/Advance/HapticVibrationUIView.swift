//
//  HapticVibrationUIView.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 26/8/25.
//

import SwiftUI

class HapticManager{
    static let instance = HapticManager()
    
    func notification (type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact (type: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: type)
        generator.impactOccurred()
    }
}

struct HapticVibrationUIView: View {
    var body: some View {
        VStack(spacing: 20){
            Button("Success") {
                HapticManager.instance.notification(type: .success)
            }
            Button("Warning") {
                HapticManager.instance.notification(type: .warning)
            }
            Button("Error") {
                HapticManager.instance.notification(type: .error)
            }
            Divider()
            Button("Heavy") {
                HapticManager.instance.impact(type: .heavy)
            }
            Button("Light") {
                HapticManager.instance.impact(type: .light)
            }
            Button("Meduim") {
                HapticManager.instance.impact(type: .medium)
            }
            Button("Rigid") {
                HapticManager.instance.impact(type: .rigid)
            }
            Button("Soft") {
                HapticManager.instance.impact(type: .soft)
            }
        }
    }
}

#Preview {
    HapticVibrationUIView()
}
