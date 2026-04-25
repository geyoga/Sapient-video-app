//
//  VideoFileImporterModifier.swift
//  Sapient
//
//  Created by georgius on 25/04/26.
//

import SwiftUI
internal import UniformTypeIdentifiers

struct VideoFileImporterModifier: ViewModifier {
    @Binding var isPresented: Bool

    var onCompletion: (URL) -> Void

    func body(content: Content) -> some View {
        content
            .fileImporter(
                isPresented: $isPresented,
                allowedContentTypes: [.movie, .video, .audiovisualContent],
                allowsMultipleSelection: false
            ) { result in
                switch result {
                case .success(let urls):
                    if let selectedUrl = urls.first {
                        onCompletion(selectedUrl)
                    }
                case .failure(let failure):
                    print("Error picking File: \(failure.localizedDescription)")
                }
            }
    }
}

// MARK: - View Extension

extension View {
    func videoFileImporter(
        isPresented: Binding<Bool>,
        onCompletion: @escaping (URL) -> Void
    ) -> some View {
        self.modifier(
            VideoFileImporterModifier(
                isPresented: isPresented,
                onCompletion: onCompletion
            ))
    }
}
