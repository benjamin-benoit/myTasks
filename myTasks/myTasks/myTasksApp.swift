//
//  myTasksApp.swift
//  myTasks
//
//  Created by Benjamin Benoit on 27/11/2020.
//

import SwiftUI

@main
struct myTasksApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
