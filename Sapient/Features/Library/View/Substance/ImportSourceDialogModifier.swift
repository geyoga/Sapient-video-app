//
//  ImportSourceDialogModifier.swift
//  Sapient
//
//  Created by georgius on 25/04/26.
//

import SwiftUI

struct ImportSourceDialogModifier: ViewModifier {
    @Binding var isPresented: Bool

    var onSelect: (ImportSource) -> Void

    func body(content: Content) -> some View {
        content
            .confirmationDialog(
                "Select Import Source",
                isPresented: $isPresented,
                titleVisibility: .visible) {
                    // create button for every `ImportSource` data
                    ForEach(ImportSource.allCases) { source in
                        Button(source.rawValue) {
                            onSelect(source)
                        }
                    }
                    Button("Cancel", role: .cancel) {}
                } message: {
                    Text("Where would you like to import your course from?")
                }
                .presentationCompactAdaptation(.popover)
    }
}

extension View {
    func importSourceDialog(
        isPresented: Binding<Bool>,
        onSelect: @escaping (ImportSource) -> Void
    ) -> some View {
        modifier(ImportSourceDialogModifier(isPresented: isPresented, onSelect: onSelect))
    }
}
