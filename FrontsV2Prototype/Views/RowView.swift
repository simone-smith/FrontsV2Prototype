//
//  RowView.swift
//  FrontsV2Prototype
//
//  Created by Simone Smith on 02/08/2022.
//

import SwiftUI

struct RowView: View {
    let row: Container.Row
    @State private var width: CGFloat = 320
    private var numberOfColumns: UInt {
        if width < 500 {
            return 2
        } else {
            return 4
        }
    }
    private var columnWidth: CGFloat {
        width / CGFloat(numberOfColumns)
    }

    func asdf(_ columns: [Container.Column]) -> [[Container.Column]] {
        var realColumns = [[Container.Column]]()
        let maxColumns: UInt = numberOfColumns
        var runningColumns: UInt = 0
        var activeIndex = 0

        for column in columns {
            if realColumns.count <= activeIndex {
                realColumns.append([])
            }
            if column.preferredColumnWidth + runningColumns > maxColumns || column == columns.last {
                let remaining = maxColumns - runningColumns
                realColumns[activeIndex].append(
                    Container.Column(
                        preferredColumnWidth: UInt(remaining),
                        lightStyle: nil,
                        darkStyle: nil,
                        modules: column.modules
                    )
                )
            } else {
                realColumns[activeIndex].append(column)
            }
            runningColumns += realColumns.last?.last?.preferredColumnWidth ?? 0
            if runningColumns >= maxColumns {
                activeIndex += 1
                runningColumns = 0
            }
        }

        return realColumns
    }

    var body: some View {

        VStack(spacing: 0) {
            ForEach(asdf(row.columns), id: \.first) { subRow in
                HStack(spacing: 0) {
                    ForEach(subRow) { item in
                        ColumnView(column: item)
                            .frame(width: columnWidth * CGFloat(item.preferredColumnWidth))
                            .border(Color.red)
                    }

                }
                .padding(.horizontal, Layout.padding / 2)
            }
        }
        .frame(maxWidth: .infinity)
        .border(Color.blue)
        .background(
            GeometryReader { geo in
                Color.clear
                    .onAppear {
                        width = geo.size.width
                    }
            }
        )
    }
}

//struct RowView_Previews: PreviewProvider {
//    static var previews: some View {
//        RowView()
//    }
//}
