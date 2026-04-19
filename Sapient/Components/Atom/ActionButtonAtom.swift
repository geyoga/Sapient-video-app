//
//  ActionButtonAtom.swift
//  Sapient
//
//  Created by georgius on 19/04/26.
//

import SwiftUI

struct ActionButtonAtom: View {

    enum Variant {
        case primary
        case secondary

        var foreground: Color {
            return AppColor.textWhite.color
        }

        var background: Color {
            switch self {
            case .primary: return AppColor.primary.color
            case .secondary: return AppColor.secondary.color
            }
        }
    }

    private let haptic = UIImpactFeedbackGenerator(style: .medium)

    var title: String
    var variant: Variant = .primary
    var isDisabled: Bool = false
    var action: () -> Void
    var body: some View {
        Button(action: {
            haptic.impactOccurred()
            action()
        }) {
            HStack(spacing: AppSpacing.sm) {
                Text(title)
                    .font(AppFont.labelAction.font)
            }
            .foregroundStyle(variant.foreground)
            .frame(maxWidth: .infinity)
            .padding(.vertical, AppSpacing.md)
            .background(variant.background)
            .clipShape(Capsule())
            .opacity(isDisabled ? 0.5 : 1.0)
        }
        .buttonStyle(ScaleButtonStyle())
        .disabled(isDisabled)
        .onAppear {
            haptic.prepare()
        }
    }
}
