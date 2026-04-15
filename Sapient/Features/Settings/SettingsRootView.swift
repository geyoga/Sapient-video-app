//
//  SettingsRootView.swift
//  Sapient
//
//  Created by georgius on 15/04/26.
//

import SwiftUI

struct SettingsRootView: View {
    @Environment(StackRouter<SettingsRoute>.self) private var router

    var body: some View {
        List {
            Button("Account") {
                router.push(.account)
            }

            Button("About") {
                router.push(.about)
            }
        }
    }
}

#Preview {
    NavigationStack {
        SettingsRootView()
            .environment(StackRouter<SettingsRoute>())
    }
}