//
//  FrontsView.swift
//  FrontsV2Prototype
//
//  Created by Simone Smith on 02/08/2022.
//

import SwiftUI

struct FrontsView: View {
    @ObservedObject var server = FrontsServer()

    var body: some View {
        if let objects = server.objects {
            NavigationView {
                ScrollView {
                    VStack {
                        ForEach(0..<3) { _ in
                            ContainerView(container: objects)
                        }
                    }
                    .navigationTitle("Fronts Rendering")
                }
            }
        } else if let error = server.loadError {
            Text(error.localizedDescription)
        } else {
            Text("Loading")
                .onAppear {
                    server.fetch()
                }
        }
    }
}

struct FrontsView_Previews: PreviewProvider {
    static var previews: some View {
        FrontsView()
    }
}
