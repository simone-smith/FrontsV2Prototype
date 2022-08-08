//
//  Models.swift
//  FrontsV2Prototype
//
//  Created by Simone Smith on 01/08/2022.
//

import Foundation
import SwiftUI

enum Layout {
    static let padding: CGFloat = 20
}

struct Container: Codable {
    let title: String
    let lightStyle: Style?
    let darkStyle: Style?
    let rows: [Row]
}

extension Container {
    struct Column: Codable, Identifiable, Equatable, Hashable {
        static func == (lhs: Container.Column, rhs: Container.Column) -> Bool {
            lhs.id == rhs.id
        }

        var id = UUID()
        let preferredColumnWidth: UInt
        let lightStyle: Style?
        let darkStyle: Style?
        let modules: [Module]

        enum CodingKeys: String, CodingKey {
            case preferredColumnWidth, lightStyle, darkStyle, modules
        }
    }

    struct Row: Codable, Identifiable {
        var id = UUID()
        let lightStyle: Style?
        let darkStyle: Style?
        let columns: [Column]

        enum CodingKeys: String, CodingKey {
            case lightStyle, darkStyle, columns
        }
    }
}

extension Container {
    struct Module: Codable, Identifiable, Equatable, Hashable {
        static func == (lhs: Container.Module, rhs: Container.Module) -> Bool {
            lhs.id == rhs.id
        }

        var id = UUID()
        let type: ModuleType
        let lightStyle: Style?
        let darkStyle: Style?
        let information: Information
        let articles: [Article]

        enum CodingKeys: String, CodingKey {
            case type, lightStyle, darkStyle, information, articles
        }

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

        struct Information: Codable, Hashable {
            static func == (lhs: Information, rhs: Information) -> Bool {
                lhs.data == rhs.data
            }

            internal init(data: [String : String]) {
                self.data = data
            }

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

struct Article: Codable, Identifiable, Hashable {
    static func == (lhs: Article, rhs: Article) -> Bool {
        lhs.id == rhs.id
    }

    var id = UUID()
    let links: ArticleLinks
    let kicker: String?
    let title: String?
    let contributors: [Contributor]?
    let trailText: String?
    let timestamp: Date?
    let commentCount: UInt?
    let rating: UInt?
    let duration: TimeInterval?
    let images: [ArticleImage]
    let sublinks: [Article]?
    let lightStyle: Style?
    let darkStyle: Style?

    enum CodingKeys: String, CodingKey {
        case links, kicker, title, contributors, trailText, timestamp, commentCount, rating, duration, images, sublinks, lightStyle, darkStyle
    }
}

struct ArticleImage: Codable, ImageTemplate, Hashable {
    let urlTemplate: String?
    let height: CGFloat?
    let width: CGFloat?
    let caption: String
    let credit: String
    let altText: String
    let placeholderColour: Color
    var aspectRatio: CGFloat {
        (height ?? 0) / (width ?? 0)
    }
}

struct ArticleLinks: Codable, Hashable {
    let uri: String
    let shortUrl: String?
    let relatedUri: String?
    let webUri: String?
}

struct Contributor: Codable, Identifiable, Hashable {
    var id = UUID()
    let name: String
    let photo: URL?

    enum CodingKeys: String, CodingKey {
        case name, photo
    }
}

struct Style: Codable, Hashable {
    let primaryColour: Color
    let secondaryColour: Color
    let overlayColour: Color
    let backgroundColour: Color
    let titleColour: Color
    let lineColour: Color
}
