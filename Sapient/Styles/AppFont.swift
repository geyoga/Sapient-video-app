//
//  AppFont.swift
//  Sapient
//
//  Created by georgius on 12/04/26.
//

import SwiftUI
import UIKit

struct FontToken {
    let family: AppFontFamily
    let lineHeight: CGFloat
    let letterSpacing: CGFloat

    var font: Font { family.swiftUIFont }
    var uiFont: UIFont { family.uiFont }

    init(
        family: AppFontFamily,
        lineHeight: CGFloat,
        letterSpacing: CGFloat
    ) {
        self.family = family
        self.lineHeight = lineHeight
        self.letterSpacing = letterSpacing
    }
}

enum NewsReaderWeight {
    case extraLight, light, regular, medium, semiBold, bold, extraBold

    func postScriptName(italic: Bool) -> String {
        switch self {
        case .extraLight:
            return italic ? "NewsreaderItalic-ExtraLight" : "NewsreaderRoman-ExtraLight"
        case .light:
            return italic ? "NewsreaderItalic-Light" : "NewsreaderRoman-Light"
        case .regular:
            return italic ? "Newsreader16pt-Italic" : "Newsreader16pt-Regular"
        case .medium:
            return italic ? "NewsreaderItalic-Medium" : "NewsreaderRoman-Medium"
        case .semiBold:
            return italic ? "NewsreaderItalic-SemiBold" : "NewsreaderRoman-SemiBold"
        case .bold:
            return italic ? "NewsreaderItalic-Bold" : "NewsreaderRoman-Bold"
        case .extraBold:
            return italic ? "NewsreaderItalic-ExtraBold" : "NewsreaderRoman-ExtraBold"
        }
    }
}

enum AppFontFamily {
    case sfPro(size: CGFloat, weight: Font.Weight = .regular)
    case newsreader(size: CGFloat, weight: NewsReaderWeight = .regular, italic: Bool = false)

    var swiftUIFont: Font {
        switch self {
        case .sfPro(let size, let weight):
            return .system(size: size, weight: weight, design: .default)
        case .newsreader(let size, let weight, let italic):
            return .custom(weight.postScriptName(italic: italic), size: size)
        }
    }

    var uiFont: UIFont {
        switch self {
        case .sfPro(let size, let weight):
            return .systemFont(ofSize: size, weight: .init(weight))
        case .newsreader(let size, let weight, let italic):
            let name = weight.postScriptName(italic: italic)
            return UIFont(name: name, size: size) ?? .systemFont(ofSize: size, weight: .regular)
        }
    }
}

enum AppFont {

    // MARK: - Display (Newsreader — editorial/hero text)
    static let displayLarge  = token(.newsreader(size: 34, weight: .bold), lineHeight: 41, spacing: 0.4)
    static let displayMedium = token(.newsreader(size: 24, weight: .semiBold, italic: false), lineHeight: 32, spacing: 0)
    static let displayItalic = token(.newsreader(size: 24, weight: .semiBold, italic: true), lineHeight: 32, spacing: 0)
    static let displaySmall  = token(.newsreader(size: 18, weight: .semiBold), lineHeight: 24, spacing: 0)

    // MARK: - Heading (Newsreader — UI structure)
    static let headingLarge     = token(.newsreader(size: 24, weight: .bold, italic: false), lineHeight: 28, spacing: -0.9)
    static let headingSemiLarge = token(.newsreader(size: 24, weight: .semiBold, italic: false), lineHeight: 28, spacing: 0)
    static let headingMedium    = token(.newsreader(size: 16, weight: .bold, italic: false), lineHeight: 24, spacing: 0)
    static let headingSmall     = token(.newsreader(size: 11, weight: .semiBold, italic: false), lineHeight: 14, spacing: 0)

    // MARK: - Body (SF Pro — readable content)
    static let bodyLarge     = token(.sfPro(size: 14, weight: .medium), lineHeight: 17, spacing: 0)
    static let bodyMedium    = token(.sfPro(size: 12, weight: .regular), lineHeight: 12, spacing: 0)
    static let bodySmall     = token(.sfPro(size: 10, weight: .regular), lineHeight: 10, spacing: 0)

    // MARK: - Label (SF Pro — captions, tags, metadata)
    static let labelHeavy   = token(.sfPro(size: 10, weight: .heavy), lineHeight: 15, spacing: 0)
    static let labelLarge   = token(.sfPro(size: 10, weight: .bold), lineHeight: 24, spacing: 0)
    static let labelMedium  = token(.sfPro(size: 10, weight: .medium), lineHeight: 14, spacing: 0.3)
    static let labelSmall   = token(.sfPro(size: 8, weight: .semibold), lineHeight: 14, spacing: 0)
    static let labelAction  = token(.sfPro(size: 13, weight: .semibold), lineHeight: 17, spacing: 0)

    // MARK: - Navigation (UIKit + SwiftUI bridge)
    static let navTitle      = token(.newsreader(size: 18, weight: .semiBold), lineHeight: 24, spacing: 0)
    static let navLargeTitle = token(.newsreader(size: 32, weight: .bold), lineHeight: 38, spacing: 0)

    // MARK: - Private factory
    private static func token(_ family: AppFontFamily, lineHeight: CGFloat, spacing: CGFloat) -> FontToken {
        FontToken(family: family, lineHeight: lineHeight, letterSpacing: spacing)
    }

}

extension UIFont.Weight {
    init(_ weight: Font.Weight) {
        switch weight {
        case .ultraLight: self = .ultraLight
        case .thin: self = .thin
        case .light: self = .light
        case .regular: self = .regular
        case .medium: self = .medium
        case .semibold: self = .semibold
        case .bold: self = .bold
        case .heavy: self = .heavy
        case .black: self = .black
        default: self = .regular
        }
    }
}

extension View {
    func fontStyle(_ token: FontToken) -> some View {
        self
            .font(token.font)
            .lineSpacing(token.lineHeight - UIFont.systemFontSize)
            .tracking(token.letterSpacing)
    }
}
