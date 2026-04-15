//
//  StackRouter.swift
//  Sapient
//
//  Created by georgius on 15/04/26.
//

import SwiftUI

@Observable final class StackRouter<Route: Hashable> {
    var path = NavigationPath()

    func push(_ route: Route) {
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
        guard !path.isEmpty else { return }
        path.removeLast(path.count)
    }

    func replaceWith(_ route: Route) {
        popToRoot()
        push(route)
    }
}