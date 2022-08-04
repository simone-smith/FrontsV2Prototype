//
//  Examples.swift
//  FrontsV2Prototype
//
//  Created by Simone Smith on 02/08/2022.
//

import Foundation
import SwiftUI

extension Container.Module {
    static func example() -> Container.Module {
        Container.example().rows.first!.columns.first!.modules.first!
    }

    static func exampleImage() -> ArticleImage {
        ArticleImage.init(urlTemplate: "https://i.guim.co.uk/img/media/ad499d43d0b529062c0c467d15b0d3be35030bd5/0_0_8000_4800/master/8000.jpg?w=#{width}&h=#{height}&q=#{quality}&fit=bounds&sig-ignores-params=true&s=c39b543daebe164b6ee24bdff4e38b8a", height: 4800, width: 8000, caption: "A single spin of the Earth marks out a day and drives the cycle of sunrise and sunset. Photograph: Photograph: Janez Volmajer/Alamy", credit: "Janez Volmajer/Alamy", altText: "The Earth with the sun rising", placeholderColour: Color.init(hex: "#121212"))
    }

    static func exampleImmersive() -> Container.Module {
        Container.Module.init(type: .immersive, lightStyle: nil, darkStyle: nil, information: .init(data: [:]), articles: [])
    }

    static func exampleArticle() -> Container.Module {
        Container.Module.init(type: .article, lightStyle: nil, darkStyle: nil, information: .init(data: [:]), articles: [])
    }

    static func exampleBoosted() -> Container.Module {
        Container.Module.init(type: .boosted, lightStyle: nil, darkStyle: nil, information: .init(data: [:]), articles: [])
    }

    static func exampleCarousel() -> Container.Module {
        Container.Module.init(type: .carousel, lightStyle: nil, darkStyle: nil, information: .init(data: [:]), articles: [])
    }

    static func examplePodcast() -> Container.Module {
        Container.Module.init(type: .podcast, lightStyle: nil, darkStyle: nil, information: .init(data: [:]), articles: [])
    }

    static func examplePodcastCarousel() -> Container.Module {
        Container.Module.init(type: .podcastCarousel, lightStyle: nil, darkStyle: nil, information: .example(), articles: [])
    }
}

extension Container.Module.Information {
    static func example() -> Container.Module.Information {
        Container.Module.Information(data: [:])
    }
}

extension Container {
    static func example() -> Container {
        let path = Bundle.main.path(forResource: "spotlight", ofType: "json")!
        let fileUrl = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: fileUrl, options: .mappedIfSafe)
        let coder = JSONDecoder()
        return try! coder.decode(Container.self, from: data)
    }
}
