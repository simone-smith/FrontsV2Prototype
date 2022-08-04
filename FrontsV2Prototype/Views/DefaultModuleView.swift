//
//  DefaultModuleView.swift
//  FrontsV2Prototype
//
//  Created by Simone Smith on 02/08/2022.
//

import Foundation
import SwiftUI

struct DefaultModuleView: View {
    let module: Container.Module

    var body: some View {
        VStack(alignment: .leading) {
            if let article = module.articles.first, let title = article.title, let image = article.images.first {
                Text(title)
                Spacer()
                ImageView(image: image)
            }
        }
        .padding(Layout.padding / 2)
    }
}

struct DefaultModuleView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultModuleView(module: .exampleArticle())
    }
}
