//
//  L10n.swift
//  Sapient
//
//  Created by georgius on 19/04/26.
//

import Foundation

enum L10n {
    enum App {
        static let name: LocalizedStringResource = "app.name"
    }

    enum Tab {
        static let insight: LocalizedStringResource = "tab.insight"
        static let library: LocalizedStringResource = "tab.library"
        static let settings: LocalizedStringResource = "tab.settings"
    }

    enum Library {
        enum Empty {
            static let title: LocalizedStringResource = "library.empty.title"
            static let subtitle: LocalizedStringResource = "library.empty.subtitle"
            static let ctaImport: LocalizedStringResource = "library.empty.cta.import"
        }
    }

    enum Settings {
        static let account: LocalizedStringResource = "settings.account"
        static let about: LocalizedStringResource = "settings.about"
        static let aboutTitle: LocalizedStringResource = "settings.about.title"
    }
}
