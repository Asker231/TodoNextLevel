//
//  TestAppApp.swift
//  TestApp
//
//  Created by ASKER on 16.05.2023.
//

import SwiftUI
import FirebaseCore

@main
struct TestAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
