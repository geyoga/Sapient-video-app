//
//  RootView.swift
//  Sapient
//
//  Created by georgius on 12/04/26.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        // Step 1: all app flows should start from this single root entry point.
        VideoPlayerView()
    }
}

#Preview {
    RootView()
}
