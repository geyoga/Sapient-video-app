//
//  VideoPlayerRootView.swift
//  Sapient
//
//  Created by georgius on 15/04/26.
//

import SwiftUI

struct VideoPlayerRootView: View {
    @Environment(StackRouter<VideoPlayerRoute>.self) private var router
    @Environment(AppRouter.self) private var appRouter

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VideoPlayerView()

                Button("Open Video Detail") {
                    router.push(.detail(id: "sample-video"))
                }
                .buttonStyle(.borderedProminent)

                Button("Jump To Library Tab") {
                    appRouter.switchTo(.library)
                }
                .buttonStyle(.bordered)
            }
            .padding()
        }
    }
}

#Preview {
    NavigationStack {
        VideoPlayerRootView()
            .environment(AppRouter())
            .environment(StackRouter<VideoPlayerRoute>())
    }
}