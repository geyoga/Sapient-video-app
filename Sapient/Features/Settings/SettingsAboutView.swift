//
//  SettingsAboutView.swift
//  Sapient
//
//  Created by georgius on 15/04/26.
//

import SwiftUI

struct SettingsAboutView: View {
    var body: some View {
        Text(L10n.Settings.aboutTitle)
            .fontStyle(AppFont.displayLarge)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
    }
}

#Preview {
    SettingsAboutView()
}