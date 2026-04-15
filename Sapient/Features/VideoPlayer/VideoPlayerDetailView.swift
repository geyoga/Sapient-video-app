//
//  VideoPlayerDetailView.swift
//  Sapient
//
//  Created by georgius on 15/04/26.
//

import SwiftUI

struct VideoPlayerDetailView: View {
    let videoID: String

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Video Detail")
                .fontStyle(AppFont.displayLarge)

            Text("Selected video id: \(videoID)")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
    }
}

#Preview {
    VideoPlayerDetailView(videoID: "sample-video")
}