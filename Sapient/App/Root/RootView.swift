//
//  RootView.swift
//  Sapient
//
//  Created by georgius on 12/04/26.
//

import SwiftUI

struct RootView: View {
    @Environment(AppRouter.self) private var appRouter
    @Environment(StackRouter<VideoPlayerRoute>.self) private var videoPlayerRouter
    @Environment(StackRouter<LibraryRoute>.self) private var libraryRouter
    @Environment(StackRouter<SettingsRoute>.self) private var settingsRouter

    var body: some View {
        @Bindable var appRouter = appRouter
        @Bindable var videoPlayerRouter = videoPlayerRouter
        @Bindable var libraryRouter = libraryRouter
        @Bindable var settingsRouter = settingsRouter

        TabView(selection: $appRouter.selectedTab) {
            NavigationStack(path: $videoPlayerRouter.path) {
                VideoPlayerRootView()
                    .navigationTitle(AppTab.videoPlayer.title)
                    .navigationDestination(for: VideoPlayerRoute.self) { route in
                        switch route {
                        case .detail(let videoID):
                            VideoPlayerDetailView(videoID: videoID)
                        }
                    }
            }
            .tabItem {
                Label(AppTab.videoPlayer.title, systemImage: AppTab.videoPlayer.systemImage)
            }
            .tag(AppTab.videoPlayer)

            NavigationStack(path: $libraryRouter.path) {
                LibraryRootView()
                    .navigationTitle(AppTab.library.title)
                    .navigationDestination(for: LibraryRoute.self) { route in
                        switch route {
                        case .detail(let itemID):
                            LibraryDetailView(itemID: itemID)
                        }
                    }
            }
            .tabItem {
                Label(AppTab.library.title, systemImage: AppTab.library.systemImage)
            }
            .tag(AppTab.library)

            NavigationStack(path: $settingsRouter.path) {
                SettingsRootView()
                    .navigationTitle(AppTab.settings.title)
                    .navigationDestination(for: SettingsRoute.self) { route in
                        switch route {
                        case .account:
                            SettingsAccountView()
                        case .about:
                            SettingsAboutView()
                        }
                    }
            }
            .tabItem {
                Label(AppTab.settings.title, systemImage: AppTab.settings.systemImage)
            }
            .tag(AppTab.settings)
        }
    }
}

#Preview {
    RootView()
        .environment(AppRouter())
        .environment(StackRouter<VideoPlayerRoute>())
        .environment(StackRouter<LibraryRoute>())
        .environment(StackRouter<SettingsRoute>())
}
