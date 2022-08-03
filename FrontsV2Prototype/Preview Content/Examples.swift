//
//  Examples.swift
//  FrontsV2Prototype
//
//  Created by Simone Smith on 02/08/2022.
//

import Foundation

extension Container.Module {
    static func example() -> Container.Module {
        Container.example().rows.first!.columns.first!.modules.first!
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
