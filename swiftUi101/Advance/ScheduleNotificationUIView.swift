//
//  ScheduleNotificationUIView.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 26/8/25.
//

import SwiftUI
import CoreLocation

class NotificationManager{
    static let instance = NotificationManager()
    
    func requestNotificationPermission(completion: (() -> Void)? = nil){
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("Error request notification permission : \(error)")
            }else{
                print("Granted Notification Permission!")
            }
        }
    }
    
    func checkPermissionAndProceed(proceed: @escaping () -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                switch settings.authorizationStatus {
                case .authorized, .provisional, .ephemeral:
                    proceed()  // ✅ Permission already granted
                case .denied:
                    print("User denied notifications ❌")
                case .notDetermined:
                    self.requestNotificationPermission {
                        proceed() // ✅ Call proceed after asking
                    }
                @unknown default:
                    break
                }
            }
        }
    }
    
    func scheduleNotification(){
        
        let contents = UNMutableNotificationContent()
        contents.title = "This is the title"
        contents.subtitle = "This is the subtitle of the notification"
        contents.body = "This is the description of the notification"
        contents.sound = .default
        contents.badge = 1
        
        // time
        let timeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // calender
//        var date = DateComponents()
//        date.hour = 16
//        date.minute = 15
////        date.weekday = 2
//        let celenderTrigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
        
        // location
//        let center = CLLocationCoordinate2D(latitude: 37.335400, longitude: -122.009201)
//        let region = CLCircularRegion(center: center, radius: 2000.0, identifier: "Headquarters")
//        region.notifyOnEntry = true
//        region.notifyOnExit = false
//        let locationTrigger = UNLocationNotificationTrigger(region: region, repeats: false)
        
        // request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: contents, trigger: timeTrigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelScheduleNotification(){
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct ScheduleNotificationUIView: View {
    var body: some View {
        VStack(spacing: 20){
            Button("Request Permission") {
                NotificationManager.instance.requestNotificationPermission()
            }
            
            Button("Start Schedule Notification") {
                NotificationManager.instance.checkPermissionAndProceed {
                    NotificationManager.instance.scheduleNotification()
                }
            }
            
            Button("Cancel Schedule Notification") {
                NotificationManager.instance.cancelScheduleNotification()
            }
        }
        .onAppear(){
            resetBadgeCount()
        }
    }
    
    func resetBadgeCount() {
        if #available(iOS 17.0, *) {
            UNUserNotificationCenter.current()
                .setBadgeCount(0) { error in
                    if let error = error {
                        print("Failed to reset badge: \(error)")
                    }
                }
        } else {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

#Preview {
    ScheduleNotificationUIView()
}
