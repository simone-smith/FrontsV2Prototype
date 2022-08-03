//
//  LayoutTitleView.swift
//  FrontsV2Prototype
//
//  Created by Simone Smith on 02/08/2022.
//

import Foundation
import SwiftUI

struct LayoutTitleView: View {
    let container: Container
    var body: some View {
        VStack {
            Rectangle()
                .fill(container.lightStyle?.lineColour ?? Color(hex: "#FFFFFF"))
                .frame(height: 2)
                .padding(.horizontal, -20)
            HStack(alignment: .top) {
                if let title = container.title {
                Text(title)
                    .font(.title)
                    .bold()
            }
        }
            .foregroundColor(container.lightStyle?.titleColour)
        }
    }
}
