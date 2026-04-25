//
//  ImportSource.swift
//  Sapient
//
//  Created by georgius on 25/04/26.
//

import Foundation

enum ImportSource: String, CaseIterable, Identifiable {
    case localFile = "Local File"
    case googleDrive = "Google Drive"
    case youtube = "YouTube"

    var id: String { return rawValue }
}
