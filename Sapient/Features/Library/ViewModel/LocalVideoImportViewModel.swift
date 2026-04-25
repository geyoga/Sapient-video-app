//
//  LocalVideoImportViewModel.swift
//  Sapient
//
//  Created by georgius on 25/04/26.
//

import AVKit
import Combine

@Observable
final class LocalVideoImportViewModel {
    
    var player: AVPlayer?
    var isLoading: Bool = false

    // MARK: - Temporary Variable
    var selectedTab: Int = 0

    func loadVideoFrom(fileURL: URL) {
        isLoading = true
        
        guard fileURL.startAccessingSecurityScopedResource() else {
            print("Permission Denied to access the file")
            isLoading = false
            return
        }

        defer { fileURL.stopAccessingSecurityScopedResource() }
        do {
            let fileName = fileURL.lastPathComponent
            let copyUrl = FileManager.default.temporaryDirectory.appendingPathComponent(fileName)

            if FileManager.default.fileExists(atPath: copyUrl.path) {
                try FileManager.default.removeItem(at: copyUrl)
            }
            try FileManager.default.copyItem(at: fileURL, to: copyUrl)
            self.player = AVPlayer(url: copyUrl)
            self.player?.play()
            self.selectedTab = 1
        } catch {
            print("Failed to copy file from Files App: \(error.localizedDescription)")
        }
        isLoading = false
        
    }
}
