//
//  SapientApp.swift
//  Sapient
//
//  Created by georgius on 11/04/26.
//

import SwiftUI
import UIKit

@main
struct SapientApp: App {

    @State private var appRouter = AppRouter()
    @State private var videoPlayerRouter = StackRouter<VideoPlayerRoute>()
    @State private var libraryRouter = StackRouter<LibraryRoute>()
    @State private var settingsRouter = StackRouter<SettingsRoute>()

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.titleTextAttributes = [
            .font: AppFont.navTitle.uiFont,
            .foregroundColor: UIColor(AppColor.textPrimary.color)
        ]
        appearance.largeTitleTextAttributes = [
            .font: AppFont.navLargeTitle.uiFont,
            .foregroundColor: UIColor(AppColor.textPrimary.color)
        ]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().prefersLargeTitles = true
    }

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
