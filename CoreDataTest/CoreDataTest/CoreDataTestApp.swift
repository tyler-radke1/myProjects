//
//  CoreDataTestApp.swift
//  CoreDataTest
//
//  Created by Tyler Radke on 12/9/22.
//

import SwiftUI

@main
struct CoreDataTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
