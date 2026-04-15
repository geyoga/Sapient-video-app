//
//  LibraryRootView.swift
//  Sapient
//
//  Created by georgius on 15/04/26.
//

import SwiftUI

struct LibraryRootView: View {
    @Environment(StackRouter<LibraryRoute>.self) private var router

    var body: some View {
        List {
            Button("Open Saved Item") {
                router.push(.detail(id: "saved-item-1"))
            }

            Button("Open Recent Item") {
                router.push(.detail(id: "recent-item-1"))
            }
        }
    }
}

#Preview {
    NavigationStack {
        LibraryRootView()
            .environment(StackRouter<LibraryRoute>())
    }
}