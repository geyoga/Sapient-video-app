//
//  LibraryEmptyStateView.swift
//  Sapient
//
//  Created by georgius on 19/04/26.
//

import SwiftUI

struct LibraryEmptyStateView: View {

    // MARK: - Public Properties

    var onImportVideo: (URL) -> Void

    // MARK: - Private Propertiess

    @State private var isDialogPresented: Bool = false
    @State private var isLocalFilePickerPresented: Bool = false

    // MARK: - Initialize
    
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

            ActionButtonAtom(
                title: String(localized: L10n.Library.Empty.ctaImport).uppercased(),
                action: {
                    isDialogPresented = true
            })
            .importSourceDialog(isPresented: $isDialogPresented) { source in
                switch source {
                case .localFile:
                    isLocalFilePickerPresented = true
                case .googleDrive:
                    print("Import from Google Drive")
                case .youtube:
                    print("Import from YouTube")
                }
            }
        }
        .padding(.top, AppSpacing.xl)
        .padding(.horizontal, AppSpacing.md)
        .padding(.bottom, AppSpacing.lg)
        .frame(maxWidth: 400, minHeight: 300, maxHeight: 450, alignment: .top)
        .background(AppColor.backgroundSecondary.color)
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        .videoFileImporter(isPresented: $isLocalFilePickerPresented) { url in
            onImportVideo(url)
        }
    }
}
