//
//  ScreenAViewController.swift
//  IntegratingSwiftUI
//
//  Created by Steve Kim on 2023/12/03.
//

import SwiftUI
import UIKit

class ScreenAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Screen A"
        view.backgroundColor = .systemPurple
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let navigationController {
            navigationController.navigationBar.prefersLargeTitles = false
            navigationController.navigationBar.tintColor = .white
            navigationController.navigationBar.standardAppearance = .common
            navigationController.navigationBar.scrollEdgeAppearance = .common
            navigationController.navigationBar.compactAppearance = .common
        }
    }

    @IBAction
    private func moveToScreenBClicked() {
        let vc = ScreenB().hostingController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
