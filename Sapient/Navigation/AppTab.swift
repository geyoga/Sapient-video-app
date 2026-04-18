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

    var title: String {
        switch self {
        case .insight:
            return "Insight"
        case .library:
            return "Library"
        case .settings:
            return "Settings"
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
