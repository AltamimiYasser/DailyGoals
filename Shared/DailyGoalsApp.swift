//
//  DailyGoalsApp.swift
//  Shared
//
//  Created by Yasser Tamimi on 09/12/2021.
//

import SwiftUI

@main
struct DailyGoalsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
