//
//  UINavigationBarAppearance+.swift
//  IntegratingSwiftUI
//
//  Created by Steve Kim on 2023/12/03.
//

import UIKit

extension UINavigationBarAppearance {
    static let common: UINavigationBarAppearance = {
        $0.backgroundEffect = .none
        $0.shadowColor = .clear
        $0.largeTitleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 24),
            .foregroundColor: UIColor.white,
        ]
        $0.titleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 17),
            .foregroundColor: UIColor.white,
        ]
        $0.setBackIndicatorImage(
            .init(named: "commonBtnBackWhite"),
            transitionMaskImage: .init(named: "commonBtnBackWhite"))
        return $0
    }(UINavigationBarAppearance())
}
