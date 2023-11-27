//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Tim Mitra on 2023-11-22.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self) 
    }
}
