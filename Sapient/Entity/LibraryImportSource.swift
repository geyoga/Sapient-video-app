//
//  LibraryImportSource.swift
//  Sapient
//
//  Created by georgius on 19/04/26.
//

import Foundation

enum LibraryImportSource: Equatable {
    case localFile(URL)
    case googleDrive(URL)
    case youtube(URL)
}

enum LibraryWebImportKind: String, CaseIterable, Identifiable {
    case googleDrive
    case youtube

    var id: String {
        rawValue
    }
}
