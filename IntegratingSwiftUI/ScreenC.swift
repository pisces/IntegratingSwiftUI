//
//  ScreenC.swift
//  IntegratingSwiftUI
//
//  Created by Steve Kim on 2023/12/03.
//

import SwiftUI

struct ScreenC: View {
    var body: some View {
        Group {
            Text("End of Screens")
                .foregroundColor(.white)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.pink)
        .edgesIgnoringSafeArea(.all)
        .ignoresSafeArea()
        .navigationTitle("Screen C")
    }
}

extension ScreenC: SwiftUIViewHostingCompatible {
    func transformNavigationController(_ navigationController: UINavigationController) {
        navigationController.navigationBar.prefersLargeTitles = false
        navigationController.navigationBar.topItem?.backButtonDisplayMode = .minimal
        navigationController.isNavigationBarHidden = false
    }
}

#Preview {
    ScreenC()
}
