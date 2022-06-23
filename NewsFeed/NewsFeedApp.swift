//
//  NewsFeedApp.swift
//  NewsFeed
//
//  Created by Jaime Lucea on 23/6/22.
//

import SwiftUI

@main
struct NewsFeedApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
