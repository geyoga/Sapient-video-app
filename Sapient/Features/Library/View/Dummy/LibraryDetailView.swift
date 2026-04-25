//
//  LibraryDetailView.swift
//  Sapient
//
//  Created by georgius on 15/04/26.
//

import SwiftUI

struct LibraryDetailView: View {
    let itemID: String

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Library Detail")
                .fontStyle(AppFont.displayLarge)

            Text("Selected item id: \(itemID)")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
    }
}

#Preview {
    LibraryDetailView(itemID: "saved-item-1")
}