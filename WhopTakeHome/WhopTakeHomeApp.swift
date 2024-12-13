//
//  WhopTakeHomeApp.swift
//  WhopTakeHome
//
//  Created by Stephen Sowole on 12/4/24.
//

import SwiftUI

@main
struct WhopTakeHomeApp: App {

    init() {
        if let largeFont = UIFont(name: "Courier", size: 28.0) {
            UINavigationBar.appearance().largeTitleTextAttributes = [.font: largeFont]
        }
        if let titleFont = UIFont(name: "Courier", size: 20.0) {
            UINavigationBar.appearance().titleTextAttributes = [.font: titleFont]
        }
    }

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
