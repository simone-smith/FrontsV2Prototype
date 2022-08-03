//
//  ColumnView.swift
//  FrontsV2Prototype
//
//  Created by Simone Smith on 02/08/2022.
//

import SwiftUI

struct ColumnView: View {
    let column: Container.Column

    var body: some View {
        VStack(spacing: 0) {
            ForEach(column.modules) { module in
                ModuleView(module: module)
            }
        }
    }
}

//struct ColumnView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColumnView()
//    }
//}
