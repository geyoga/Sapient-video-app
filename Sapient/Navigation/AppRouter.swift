//
//  AppRouter.swift
//  Sapient
//
//  Created by Georgius Dewantama on 14/04/26.
//

import SwiftUI

@Observable final class AppRouter {
    var path = NavigationPath()

    func push(_ route: AppRoute) {
        path.append(route)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func pop(count: Int) {
        let safeCount = min(count, path.count)
        guard safeCount > 0 else { return }
        path.removeLast(safeCount)
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    func replaceWith(with route: AppRoute) {
        path.removeLast(path.count)
        path.append(route)
    }
}
