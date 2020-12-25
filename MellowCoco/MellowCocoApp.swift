//
//  MellowCocoApp.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/25.
//

import SwiftUI

@main
struct MellowCocoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
