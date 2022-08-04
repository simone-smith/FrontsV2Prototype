//
//  ImageView.swift
//  FrontsV2Prototype
//
//  Created by Simone Smith on 03/08/2022.
//

import SwiftUI

struct ImageView: View {
    let image: ArticleImage
    @State private var height: CGFloat = 100
    var body: some View {
        GeometryReader { geo in
            let aspect = CGFloat(image.height ?? 0) / CGFloat(image.width ?? 0) // 3:5
            let width = geo.frame(in: .local).width
            let height = width * aspect
            if let imageURL = image.imageURL(size: CGSize(width: width, height: height)) {
                AsyncImage(url: imageURL) { image in
                    image.resizable()
                    .scaledToFill()
                    .onAppear {
                        self.height = height
                    }
                } placeholder: {
                    ProgressView()
                }
            } else {
                EmptyView()
            }

    }
    .frame(height: height)
    .clipped()
    .cornerRadius(5)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: Container.Module.exampleImage())
            .padding(20)
            .previewLayout(.sizeThatFits)
    }
}
