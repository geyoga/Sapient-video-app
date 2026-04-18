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
            TabNavigationShell(
                path: $libraryRouter.path,
                tab: .library,
                title: AppTab.library.title,
                root: {
                    LibraryRootView()
                },
                destination: { (route: LibraryRoute) in
                    switch route {
                    case .detail(let itemID):
                        LibraryDetailView(itemID: itemID)
                    }
                }
            )
            TabNavigationShell(
                path: $videoPlayerRouter.path,
                tab: .insight,
                title: AppTab.insight.title,
                root: {
                    VideoPlayerRootView()
                },
                destination: { (route: VideoPlayerRoute) in
                    switch route {
                    case .detail(let id):
                        VideoPlayerDetailView(videoID: id)
                    }
                }
            )
            TabNavigationShell(
                path: $settingsRouter.path,
                tab: .settings,
                title: AppTab.settings.title,
                root: {
                    SettingsRootView()
                },
                destination: { (route: SettingsRoute) in
                    switch route {
                    case .account:
                        SettingsAccountView()
                    case .about:
                        SettingsAboutView()
                    }
                }
            )
        }
        .tint(AppColor.secondary.color)
    }
}

#Preview {
    RootView()
        .environment(AppRouter())
        .environment(StackRouter<VideoPlayerRoute>())
        .environment(StackRouter<LibraryRoute>())
        .environment(StackRouter<SettingsRoute>())
}
