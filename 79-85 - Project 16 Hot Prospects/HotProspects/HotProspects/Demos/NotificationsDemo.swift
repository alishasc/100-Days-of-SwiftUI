//
//  NotificationsDemo.swift
//  HotProspects
//
//  Created by Alisha Carrington on 25/08/2025.
//

import SwiftUI
import UserNotifications

struct NotificationsDemo: View {
    var body: some View {
        VStack(spacing: 30) {
            // request permission from user to send local notifications
            Button("Request Permission") {
                // closure will get called and tell us whether the request was successful or not
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            // show the actual notification
            Button("Schedule Notification") {
                // what should be shown in the notification
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default
                
                // when the notification should be shown - 5 seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                // combines the content and trigger with a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                // add our notification request
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

#Preview {
    NotificationsDemo()
}
