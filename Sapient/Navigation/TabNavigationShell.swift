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
    @ViewBuilder let root: () -> Content
    @ViewBuilder let destination: (Route) -> Destination

    init(
        path: Binding<NavigationPath>,
        tab: AppTab,
        @ViewBuilder root: @escaping () -> Content,
        @ViewBuilder destination: @escaping (Route) -> Destination
    ) {
        self._path = path
        self.tab = tab
        self.root = root
        self.destination = destination
    }

    var body: some View {
        NavigationStack(path: $path) {
            root()
                .navigationDestination(for: Route.self, destination: destination)
        }
        .tabItem {
            Label(tab.title.uppercased(), systemImage: tab.systemImage)
        }
        .tag(tab)
    }
}
