//
//  RowView.swift
//  FrontsV2Prototype
//
//  Created by Simone Smith on 02/08/2022.
//

import SwiftUI

struct RowView: View {
    let row: Container.Row

    var body: some View {
        HStack(spacing: 0) {
            ForEach(row.columns) { column in
                ColumnView(column: column)
            }
        }
        .padding(.horizontal, Layout.padding / 2)
    }
}

//struct RowView_Previews: PreviewProvider {
//    static var previews: some View {
//        RowView()
//    }
//}
