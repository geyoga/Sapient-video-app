//
//  VideoPlayerView.swift
//  Sapient
//
//  Created by georgius on 11/04/26.
//

import AVKit
import SwiftUI

public struct VideoPlayerView: View {

    private let videoUrl: URL? = URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8")
    private let alternateVideoUrl: URL? = URL(string: "https://www.w3schools.com/tags/mov_bbb.mp4")

    public var body: some View {
        VStack {
            if let url = alternateVideoUrl {
                NativeVideoPlayer(player: AVPlayer(url: url))
                    .aspectRatio(16/9, contentMode: .fit)
                    .frame(maxWidth: .infinity)
            } else {
                Text("No video available")
            }
            Spacer()
            Text("hello")
                .fontStyle(AppFont.displayMedium)
        }
    }
}

#Preview {
    VideoPlayerView()
}
