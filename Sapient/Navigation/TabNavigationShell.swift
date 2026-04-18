//
//  TabNavigationShell.swift
//  Sapient
//
//  Created by georgius on 18/04/26.
//

import SwiftUI

struct TabNavigationShell<Route: Hashable, Content: View, Destination: View>: View {

    @Binding var path: NavigationPath
    let tab: AppTab
    let title: String
    let root: Content
    @ViewBuilder let destination: (Route) -> Destination

    init(
        path: Binding<NavigationPath>,
        tab: AppTab,
        title: String,
        @ViewBuilder root: () -> Content,
        @ViewBuilder destination: @escaping (Route) -> Destination
    ) {
        self._path = path
        self.tab = tab
        self.title = title
        self.root = root()
        self.destination = destination
    }

    var body: some View {
        NavigationStack(path: $path) {
            root
                .navigationTitle(title)
                .navigationDestination(for: Route.self, destination: destination)
        }
        .tabItem {
            Label(tab.title.uppercased(), systemImage: tab.systemImage)
        }
        .tag(tab)
    }
}
