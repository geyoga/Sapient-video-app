//
//  LocalFileService.swift
//  Sapient
//
//  Created by georgius on 25/04/26.
//

import Foundation
import AVFoundation

class LocalFileService {
    static let shared = LocalFileService()

    private init() {}
    
    // Get Permanent directory
    private var documentsDirectory: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }

    // Save the video permanently and return the new filename
    func saveVideo(from temporaryUrl: URL) -> String {
        let uniqueFilename = UUID().uuidString + ".mp4"
        let destionationUrl = documentsDirectory.appendingPathComponent(uniqueFilename)

        do {
            try FileManager.default.copyItem(at: temporaryUrl, to: destionationUrl)
        } catch {
            print(error.localizedDescription)
        }

        return uniqueFilename
    }

    // Return the the video URL
    func getVideoUrl(for filename: String) -> URL {
        return documentsDirectory.appendingPathComponent(filename)
    }

    func deleteVideoFile(filename: String) {
        let fileUrl = getVideoUrl(for: filename)
        if FileManager.default.fileExists(atPath: fileUrl.path) {
            try? FileManager.default.removeItem(at: fileUrl)
        }
    }
}
