//
//  textploreApp.swift
//  watch textplore Extension
//
//  Created by Haryanto Salim on 13/08/21.
//

import SwiftUI

@main
struct textploreApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
