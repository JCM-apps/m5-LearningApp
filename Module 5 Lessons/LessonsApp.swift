//
//  Module_5_LessonsApp.swift
//  Module 5 Lessons
//
//  Created by Juan Meneses on 2/17/23.
//

import SwiftUI

@main
struct LessonsApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
