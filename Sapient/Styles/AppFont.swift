//
//  AppFont.swift
//  Sapient
//
//  Created by georgius on 12/04/26.
//

import SwiftUI

struct FontToken {
    let font: Font
    let lineHeight: CGFloat
    let letterSpacing: CGFloat

    init(
        size: CGFloat,
        weight: Font.Weight = .regular,
        design: Font.Design = .rounded,
        lineHeight: CGFloat,
        letterSpacing: CGFloat
    ) {
        self.font = .system(size: size, weight: weight, design: design)
        self.lineHeight = lineHeight
        self.letterSpacing = letterSpacing
    }
}

enum AppFont {

    static let displayLarge = FontToken(size: <#T##CGFloat#>, weight: <#T##Font.Weight#>, design: <#T##Font.Design#>, lineHeight: <#T##CGFloat#>, letterSpacing: <#T##CGFloat#>)
}
