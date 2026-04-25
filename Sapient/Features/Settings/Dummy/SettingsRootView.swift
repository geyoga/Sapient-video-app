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
            Button {
                router.push(.account)
            } label: {
                Text(L10n.Settings.account)
            }

            Button {
                router.push(.about)
            } label: {
                Text(L10n.Settings.about)
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