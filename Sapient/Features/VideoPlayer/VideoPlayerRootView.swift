//
//  VideoPlayerRootView.swift
//  Sapient
//
//  Created by georgius on 15/04/26.
//

import SwiftUI
import AVKit

struct VideoPlayerRootView: View {
    @Environment(StackRouter<VideoPlayerRoute>.self) private var router
    @Environment(AppRouter.self) private var appRouter
    @Environment(LocalVideoImportViewModel.self) private var viewModel
    
    var body: some View {
        VStack {
            if let player = viewModel.player {
                VideoPlayer(player: player)
                    .edgesIgnoringSafeArea(.top) // Makes it look cinematic
                    .onDisappear {
                        // Optional: Pause video if user switches back to the Import tab
                        player.pause()
                    }
            } else {
                VStack(spacing: 20) {
                    Image(systemName: "video.slash")
                        .font(.system(size: 50))
                        .foregroundColor(.secondary)
                    
                    Text("No Video Loaded")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text("Go to the Import tab to select a video.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

