//
//  LibraryRootView.swift
//  Sapient
//
//  Created by georgius on 15/04/26.
//

import SwiftUI

struct LibraryRootView: View {
    @Environment(StackRouter<LibraryRoute>.self) private var router
    @Environment(LocalVideoImportViewModel.self) private var viewModel

    var body: some View {
        VStack {
            LibraryEmptyStateView(
                onImportVideo: { url in
                    viewModel.loadVideoFrom(fileURL: url)
                })
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .background(AppColor.backgroundPrimary.color)
    }
}
