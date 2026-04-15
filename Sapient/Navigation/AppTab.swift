//
//  AppTab.swift
//  Sapient
//
//  Created by georgius on 15/04/26.
//

import Foundation

enum AppTab: Hashable {
    case videoPlayer
    case library
    case settings

    var title: String {
        switch self {
        case .videoPlayer:
            return "Video"
        case .library:
            return "Library"
        case .settings:
            return "Settings"
        }
    }

    var systemImage: String {
        switch self {
        case .videoPlayer:
            return "play.square"
        case .library:
            return "books.vertical"
        case .settings:
            return "gearshape"
        }
    }
}