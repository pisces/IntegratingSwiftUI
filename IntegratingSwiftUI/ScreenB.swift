//
//  ScreenB.swift
//  IntegratingSwiftUI
//
//  Created by Steve Kim on 2023/12/03.
//

import SwiftUI

struct ScreenB: View {
    var body: some View {
        Group {
            NavigationLink {
                ScreenC().hostingControllerPresentor()
            } label: {
                Text("Move to Screen C")
                    .foregroundColor(.white)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("Screen B")
    }
}

extension ScreenB: SwiftUIViewHostingCompatible {
    func transformNavigationController(_ navigationController: UINavigationController) {
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.topItem?.backButtonDisplayMode = .minimal
        navigationController.isNavigationBarHidden = false
    }
}

#Preview {
    ScreenB()
}
