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
            SwiftUIViewHostingCommon.navigationTransform(navigationController)
        }
    }

    @IBAction
    private func moveToScreenBClicked() {
        let vc = ScreenB().hostingController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
