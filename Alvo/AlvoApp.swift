//
//  AlvoApp.swift
//  Alvo
//
//  Created by Cáren Sousa on 08/09/22.
//

import SwiftUI

@main
struct AlvoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
