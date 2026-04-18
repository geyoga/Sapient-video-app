//
//  AppColor.swift
//  Sapient
//
//  Created by georgius on 12/04/26.
//

import SwiftUI

// MARK: - Color Token

struct ColorToken {
    let light: Color
    let dark: Color

    var color: Color {
        Color(UIColor { traits in
            traits.userInterfaceStyle == .dark ? UIColor(dark) : UIColor(light)
        })
    }

    init(_ light: Color, dark: Color? = nil) {
        self.light = light
        self.dark = dark ?? light
    }
}

enum AppColor {

    // MARK: - Brand
    static let primary = ColorToken(.init(hex: "680018"))
    static let secondary = ColorToken(.init(hex: "AC293B"))

    // MARK: - Text
    static let textPrimary = ColorToken(.init(hex: "1B1C19"))
    static let textSecondary = ColorToken(.init(hex: "7F766C"))
    static let textWhite = ColorToken(.init(hex: "FFFFFF"))

    // MARK: - Background
    static let backgroundPrimary = ColorToken(.init(hex: "FBF9F4"))
    static let backgroundSecondary = ColorToken(.init(hex: "EAE8E3"))
    static let cardBackground = ColorToken(.init(hex: "F2F1EC"))

}
