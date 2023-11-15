//
//  SongsToPlayApp.swift
//  SongsToPlay
//
//  Created by Ben Scheirman on 11/14/23.
//

import SwiftUI
import SwiftData


enum ModelRoot {
    static var rootModels: [any PersistentModel.Type] = [Artist.self]
}

@main
struct SongsToPlayApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    #if DEBUG
                    let url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
                    print(url.path(percentEncoded: false))

                    if ProcessInfo.processInfo.arguments.contains(where: { $0 == "-cleandb" }) {
                        try! FileManager.default.removeItem(at: url)
                    }
                    #endif
                }
                .modelContainer(for: ModelRoot.rootModels)
        }
    }
}
