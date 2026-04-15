//
//  SapientApp.swift
//  Sapient
//
//  Created by georgius on 11/04/26.
//

import SwiftUI

@main
struct SapientApp: App {

    @State private var appRouter = AppRouter()
    @State private var videoPlayerRouter = StackRouter<VideoPlayerRoute>()
    @State private var libraryRouter = StackRouter<LibraryRoute>()
    @State private var settingsRouter = StackRouter<SettingsRoute>()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(appRouter)
                .environment(videoPlayerRouter)
                .environment(libraryRouter)
                .environment(settingsRouter)
        }
    }
}
