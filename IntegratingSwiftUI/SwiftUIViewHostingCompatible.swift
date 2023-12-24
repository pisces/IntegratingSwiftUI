//
//  SwiftUIViewHostingCompatible.swift
//  IntegratingSwiftUI
//
//  Created by Steve Kim on 2023/12/03.
//

import SwiftUI

// MARK: - SwiftUIViewHostingCompatible

public protocol SwiftUIViewHostingCompatible: View {
    var navigationTitle: String { get }
    func transformNavigationController(_ navigationController: UINavigationController)
}

extension SwiftUIViewHostingCompatible {
    public func hostingController() -> CompatibleHostingController<Self> {
        let controller = CompatibleHostingController(rootView: self)
        controller.navigationItem.title = navigationTitle
        return controller
    }

    public func hostingControllerPresentor() -> some View {
        CompatibleHostingControllerRepresentor(rootView: self)
            .navigationTitle(navigationTitle)
            .ignoresSafeArea()
    }
}

// MARK: - CompatibleHostingController

public final class CompatibleHostingController<T>: UIHostingController<T> where T: SwiftUIViewHostingCompatible {

    // MARK: Lifecycle

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        transformNavigationIfExist()
    }

    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setNavigationBarHiddenIfExist()
    }

    // MARK: Public

    private func transformNavigationIfExist() {
        if let navigationController {
            rootView.transformNavigationController(navigationController)
        }
    }

    private func setNavigationBarHiddenIfExist() {
        if let navigationController {
            let name = "\(String(describing: navigationController.visibleViewController))"
            let isHostingController = name.contains("HostingController") == true
            let isHidden = !isHostingController
            navigationController.setNavigationBarHidden(isHidden, animated: true)
        }
    }
}

// MARK: - CompatibleHostingControllerRepresentor

public struct CompatibleHostingControllerRepresentor<T>: UIViewControllerRepresentable where T: SwiftUIViewHostingCompatible {
    public typealias UIViewControllerType = CompatibleHostingController<T>

    public let rootView: T

    public func makeUIViewController(context: Context) -> UIViewControllerType {
        CompatibleHostingController(rootView: rootView)
    }

    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}

// MARK: Public

public typealias NavigationTransform = (UINavigationController) -> Void
