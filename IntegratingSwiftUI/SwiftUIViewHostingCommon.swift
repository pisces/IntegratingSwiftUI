//
//  SwiftUIViewHostingCommon.swift
//  IntegratingSwiftUI
//
//  Created by Steve Kim on 2023/12/24.
//

import UIKit

enum SwiftUIViewHostingCommon { }

extension SwiftUIViewHostingCommon {
    static let navigationTransform: NavigationTransform = {
        $0.navigationBar.tintColor = .white
        $0.navigationBar.standardAppearance = .common
        $0.navigationBar.scrollEdgeAppearance = .common
        $0.navigationBar.compactAppearance = .common

        $0.previousController?.navigationItem.backButtonDisplayMode = .minimal

        $0.setNavigationBarHidden(false, animated: true)
    }
}

extension UINavigationController {
    fileprivate var previousController: UIViewController? {
        visibleViewController
            .flatMap { viewControllers.firstIndex(of: $0) }
            .flatMap {
                let index = $0 - 1
                return index >= 0 && index < viewControllers.count ? viewControllers[index] : nil
            }
    }
}
