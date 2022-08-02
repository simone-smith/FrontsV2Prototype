//
//  ContentView.swift
//  FrontsV2Prototype
//
//  Created by Simone Smith on 01/08/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var server = FrontsServer()

    var body: some View {
        if let objects = server.objects {
            //replace these text objects with a module, then switch on the module type to determine which view to display e.g. immersive or podcast etc. Look at layout type in Ben's repo for an example
            ForEach(objects.items) { item in
                ForEach(item.column) { column in
                    ForEach(column.modules) { module in
                        switch module.type {
                        case .immersive: ImmersiveLayoutView(module)
                        default: DefaultLayoutView(module)
                        }
                    }
                }
            }

        } else {
            Text("Loading")
                .onAppear {
                    server.fetch()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
