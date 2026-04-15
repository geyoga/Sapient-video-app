//
//  AppRouter.swift
//  Sapient
//
//  Created by Georgius Dewantama on 14/04/26.
//

import Foundation

@Observable final class AppRouter {
    var selectedTab: AppTab = .videoPlayer

    func switchTo(_ tab: AppTab) {
        selectedTab = tab
    }
}
