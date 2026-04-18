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
            NavigationStack(path: $libraryRouter.path) {
                LibraryRootView()
                    .navigationTitle(AppTab.library.title)
                    .navigationBarTitleDisplayMode(.large)
                    .navigationDestination(for: LibraryRoute.self) { route in
                        switch route {
                        case .detail(let itemID):
                            LibraryDetailView(itemID: itemID)
                        }
                    }
            }
            .tabItem {
                Label(AppTab.library.title.uppercased(), systemImage: AppTab.library.systemImage)
            }
            .tag(AppTab.library)

            NavigationStack(path: $videoPlayerRouter.path) {
                VideoPlayerRootView()
                    .navigationTitle(AppTab.insight.title)
                    .navigationBarTitleDisplayMode(.large)
                    .navigationDestination(for: VideoPlayerRoute.self) { route in
                        switch route {
                        case .detail(let id):
                            VideoPlayerDetailView(videoID: id)
                        }
                    }
            }
            .tabItem {
                Label(AppTab.insight.title.uppercased(), systemImage: AppTab.insight.systemImage)
            }
            .tag(AppTab.insight)

            NavigationStack(path: $settingsRouter.path) {
                SettingsRootView()
                    .navigationTitle(AppTab.settings.title)
                    .navigationBarTitleDisplayMode(.large)
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
                Label(AppTab.settings.title.uppercased(), systemImage: AppTab.settings.systemImage)
            }
            .tag(AppTab.settings)
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
