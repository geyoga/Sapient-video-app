//
//  VideoTopic.swift
//  Sapient
//
//  Created by georgius on 25/04/26.
//

import Foundation
import SwiftData

@Model
class VideoTopic {
    var id: UUID = UUID()
    var title: String
    var backgroundImage: Data?
    var createdAt: Date = Date()

    @Relationship(deleteRule: .cascade, inverse: \VideoItem.topic)
    var videos: [VideoItem] = []

    init(title: String) {
        self.title = title
    }
}

@Model
class VideoItem {
    var id: UUID = UUID()
    var title: String
    var filename: String
    var orderIndex: Int
    var isMarkedComplete: Bool = false

    var topic: VideoTopic?

    init(title: String, filename: String, orderIndex: Int) {
        self.title = title
        self.filename = filename
        self.orderIndex = orderIndex
    }
}
