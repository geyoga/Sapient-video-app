//
//  AppTab.swift
//  Sapient
//
//  Created by georgius on 15/04/26.
//

import Foundation

enum AppTab: Hashable {
    case insight
    case library
    case settings

    var title: LocalizedStringResource {
        switch self {
        case .insight:
            return L10n.Tab.insight
        case .library:
            return L10n.Tab.library
        case .settings:
            return L10n.Tab.settings
        }
    }

    var systemImage: String {
        switch self {
        case .insight:
            return "chart.pie.fill"
        case .library:
            return "books.vertical"
        case .settings:
            return "gearshape.fill"
        }
    }
}
