//
//  ImmersiveModuleView.swift
//  FrontsV2Prototype
//
//  Created by Simone Smith on 02/08/2022.
//

import Foundation
import SwiftUI

struct ImmersiveModuleView: View {
    let module: Container.Module

    var body: some View {
        ZStack(alignment: .bottom) {
            if let article = module.articles.first, let title = article.title, let image = article.images.first {
                ImageView(image: image)
                    .overlay(
                        Text(title)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .opacity(0.7),
                        alignment: .bottom
                    )
            }
        }
        .padding(Layout.padding / 2)
    }
}

struct ImmersiveModuleView_Previews: PreviewProvider {
    static var previews: some View {
        ImmersiveModuleView(module: .example())
    }
}
