//
//  NewsFeedApp.swift
//  NewsFeed
//
//  Created by Jaime Lucea on 23/6/22.
//

import SwiftUI
import Foundation

@main
struct NewsFeedApp: App {

    let persistenceController = PersistenceController.shared

    var body: some Scene {
        
        WindowGroup {
            NewsListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
    
}
