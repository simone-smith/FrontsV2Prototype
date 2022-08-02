//
//  Models.swift
//  FrontsV2Prototype
//
//  Created by Simone Smith on 01/08/2022.
//

import Foundation
import SwiftUI

struct Container: Codable {
    let title: String
    let lightStyle: Style?
    let darkStyle: Style?
    let items: [Row]
}

extension Container {
    struct Column: Codable {
        let preferredColumnWidth: UInt
        let lightStyle: Style?
        let darkStyle: Style?
        let modules: [Module]
    }

    struct Row: Codable {
        let lightStyle: Style?
        let darkStyle: Style?
        let column: [Column]
    }
}

extension Container {
    struct Module: Codable {
        let type: ModuleType
        let lightStyle: Style?
        let darkStyle: Style?
        let information: ModuleInformation
        let articles: [Article]

        enum ModuleType: String, Codable {
            case carousel
            case article
            case immersive
            case boosted
            case podcast
            case podcastCarousel
            case video
            case mpu
            case html // fallback
        }

        struct ModuleInformation: Codable {
            let data: [String: String]
            // an example of why this struct might be useful
            var duration: Int? {
                return Int(data["duration"]!)
            }

            init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                self.data = try container.decode([String: String].self)
            }
        }
    }
}

struct Article: Codable {
    let links: ArticleLinks
    let kicker: String?
    let title: String?
    let contributors: [Contributor]?
    let trailText: String?
    let timestamp: Date?
    let commentCount: UInt?
    let rating: UInt?
    let duration: TimeInterval?
    let image: ArticleImage
    let sublinks: [Article]?
    let lightStyle: Style?
    let darkStyle: Style?
}

struct ArticleImage: Codable {
    let urlTemplate: String
    let height: UInt
    let width: UInt
    let caption: String
    let credit: String
    let altText: String
    let placeholderColour: Color
}

struct ArticleLinks: Codable {
    let uri: String
    let shortUrl: String?
    let relatedUri: String?
    let webUri: String?
}

struct Contributor: Codable {
    let name: String
    let photo: URL?
}

struct Style: Codable {
    let primaryColour: Color
    let secondaryColour: Color
    let overlayColour: Color
    let backgroundColour: Color
    let titleColour: Color
    let lineColour: Color
}
