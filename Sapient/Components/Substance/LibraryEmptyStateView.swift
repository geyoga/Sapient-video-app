//
//  LibraryEmptyStateView.swift
//  Sapient
//
//  Created by georgius on 19/04/26.
//

import SwiftUI

struct LibraryEmptyStateView: View {
    var body: some View {
        VStack(spacing: AppSpacing.md) {
            Image("icOwlDefault")
                .padding(.bottom, AppSpacing.sm)

            VStack(spacing: AppSpacing.sm) {
                Text(L10n.Library.Empty.title)
                    .font(AppFont.headingSemiLarge.font)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(L10n.Library.Empty.subtitle)
                    .font(AppFont.bodyLarge.font)
                    .foregroundStyle(AppColor.textSecondary.color)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.horizontal, AppSpacing.lg)
            Spacer()

            ActionButtonAtom(title: String(localized: L10n.Library.Empty.ctaImport), action: {
                
            })
        }
        .padding(.top, AppSpacing.xl)
        .padding(.horizontal, AppSpacing.md)
        .padding(.bottom, AppSpacing.lg)
        .frame(maxWidth: 400, minHeight: 300, maxHeight: 450, alignment: .top)
        .background(AppColor.backgroundSecondary.color)
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
    }
}

#Preview {
    LibraryEmptyStateView()
        .padding()
}
