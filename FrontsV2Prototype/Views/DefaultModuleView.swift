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
        Text("hello")
    }
}

struct DefaultModuleView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultModuleView(module: .exampleArticle())
    }
}
