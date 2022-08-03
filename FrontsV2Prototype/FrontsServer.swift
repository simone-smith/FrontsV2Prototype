//
//  FrontsServer.swift
//  FrontsV2Prototype
//
//  Created by Simone Smith on 01/08/2022.
//

import Foundation

class FrontsServer: ObservableObject {
    
    @Published var objects: Container?
    @Published var loadError: Error?

    func fetch() {
        if let path = Bundle.main.path(forResource: "spotlight", ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                let coder = JSONDecoder()
                self.objects = try coder.decode(Container.self, from: data)
            } catch {
                print("bad stuff: \(error)")
                self.loadError = error
            }
        }
    }
}
