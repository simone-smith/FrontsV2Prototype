//
//  ModuleView.swift
//  FrontsV2Prototype
//
//  Created by Simone Smith on 02/08/2022.
//

import SwiftUI

struct ModuleView: View {
    let module: Container.Module

    var body: some View {
        switch module.type {
        case .immersive: ImmersiveModuleView(module: module)
        default: DefaultModuleView(module: module)
        }
    }
}

struct ModuleView_Previews: PreviewProvider {
    static var previews: some View {
        ModuleView(module: .exampleImmersive())
    }
}
