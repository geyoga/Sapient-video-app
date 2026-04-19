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
    @Environment(\.locale) private var locale

    var body: some View {
        @Bindable var appRouter = appRouter
        @Bindable var videoPlayerRouter = videoPlayerRouter
        @Bindable var libraryRouter = libraryRouter
        @Bindable var settingsRouter = settingsRouter

        TabView(selection: $appRouter.selectedTab) {
            NavigationStack(path: $libraryRouter.path) {
                LibraryRootView()
                    .navigationTitle(Text(L10n.App.name))
                    .navigationBarTitleDisplayMode(.large)
                    .navigationDestination(for: LibraryRoute.self) { route in
                        switch route {
                        case .detail(let itemID):
                            LibraryDetailView(itemID: itemID)
                        }
                    }
            }
            .tabItem {
                Label {
                    Text(String(localized: AppTab.library.title).uppercased(with: locale))
                } icon: {
                    Image(systemName: AppTab.library.systemImage)
                }
            }
            .tag(AppTab.library)

            NavigationStack(path: $videoPlayerRouter.path) {
                VideoPlayerRootView()
                    .navigationTitle(Text(AppTab.insight.title))
                    .navigationBarTitleDisplayMode(.large)
                    .navigationDestination(for: VideoPlayerRoute.self) { route in
                        switch route {
                        case .detail(let id):
                            VideoPlayerDetailView(videoID: id)
                        }
                    }
            }
            .tabItem {
                Label {
                    Text(String(localized: AppTab.insight.title).uppercased(with: locale))
                } icon: {
                    Image(systemName: AppTab.insight.systemImage)
                }
            }
            .tag(AppTab.insight)

            NavigationStack(path: $settingsRouter.path) {
                SettingsRootView()
                    .navigationTitle(Text(AppTab.settings.title))
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
                Label {
                    Text(String(localized: AppTab.settings.title).uppercased(with: locale))
                } icon: {
                    Image(systemName: AppTab.settings.systemImage)
                }
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
