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
    }
}

extension ScreenC: SwiftUIViewHostingCompatible {
    var navigationTitle: String {
       "Screen C"
    }

    func transformNavigationController(_ navigationController: UINavigationController) {
        SwiftUIViewHostingCommon.navigationTransform(navigationController)
    }
}

#Preview {
    ScreenC()
}
