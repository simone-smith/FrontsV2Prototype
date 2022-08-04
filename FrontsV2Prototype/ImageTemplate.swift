//
//  ImageTemplate.swift
//  FrontsV2Prototype
//
//  Created by Simone Smith on 03/08/2022.
//

import Foundation
import UIKit

protocol ImageTemplate {
    var urlTemplate: String? {get}
}

extension ImageTemplate {
    func imageURL(size: CGSize) -> URL? {
        guard var urlTemplate = urlTemplate else { return nil }
        urlTemplate = urlTemplate.replacingOccurrences(of: "#{width}", with: "\(size.width)")
        urlTemplate = urlTemplate.replacingOccurrences(of: "#{height}", with: "\(size.height)")
        urlTemplate = urlTemplate.replacingOccurrences(of: "#{quality}", with: "100")
        urlTemplate = urlTemplate.replacingOccurrences(of: "&fit=bounds", with: "&fill=bounds")
        guard let url = URL(string: urlTemplate) else { return nil }
        return url
    }
}
