//
//  SwiftUIViewHostingCompatible.swift
//  IntegratingSwiftUI
//
//  Created by Steve Kim on 2023/12/03.
//

import SwiftUI

// MARK: - SwiftUIViewHostingCompatible

public protocol SwiftUIViewHostingCompatible: View {
    func transformNavigationController(_ navigationController: UINavigationController)
}

extension SwiftUIViewHostingCompatible {
    public func hostingController() -> CompatibleHostingController<Self> {
        CompatibleHostingController(rootView: self, navigationTransform: transformNavigationController)
    }

    public func hostingControllerPresentor() -> some View {
        CompatibleHostingControllerRepresentor(
            rootView: self,
            navigationTransform: transformNavigationController)
        .ignoresSafeArea()
    }
}

// MARK: - CompatibleHostingController

public final class CompatibleHostingController<T>: UIHostingController<T> where T: View {

    // MARK: Lifecycle

    public init(rootView: T, navigationTransform: @escaping NavigationTransform = { _ in }) {
        self.navigationTransform = navigationTransform
        super.init(rootView: rootView)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        wasNavigationBarHidden = navigationController?.isNavigationBarHidden
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let navigationController {
            navigationController.isNavigationBarHidden = true
            navigationTransform(navigationController)
        }
    }

    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let wasNavigationBarHidden {
            navigationController?.isNavigationBarHidden = wasNavigationBarHidden
        }
    }

    // MARK: Public

    public typealias NavigationTransform = (UINavigationController) -> Void

    // MARK: Private

    private let navigationTransform: NavigationTransform

    private var wasNavigationBarHidden: Bool?
}

// MARK: - CompatibleHostingControllerRepresentor

public struct CompatibleHostingControllerRepresentor<T>: UIViewControllerRepresentable where T: View {
    public typealias UIViewControllerType = CompatibleHostingController<T>

    public let rootView: T
    public let navigationTransform: CompatibleHostingController.NavigationTransform

    public func makeUIViewController(context: Context) -> UIViewControllerType {
        CompatibleHostingController(rootView: rootView, navigationTransform: navigationTransform)
    }

    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}
