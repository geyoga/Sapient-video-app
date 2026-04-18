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

        }
        .scrollContentBackground(.hidden)
        .background(AppColor.backgroundPrimary.color)
    }
}

#Preview {
    NavigationStack {
        LibraryRootView()
            .environment(StackRouter<LibraryRoute>())
    }
}
