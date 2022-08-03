//
//  ContainerView.swift
//  FrontsV2Prototype
//
//  Created by Simone Smith on 01/08/2022.
//

import SwiftUI

struct ContainerView: View {
    let container: Container

    var body: some View {
        VStack {
            LayoutTitleView(container: container)
            VStack(spacing: 0) {
                ForEach(container.rows) { row in
                    RowView(row: row)
                }
            }
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView(container: .example())
    }
}
