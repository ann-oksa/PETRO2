//
//  PETRO2App.swift
//  PETRO2
//
//  Created by mac on 16.03.2023.
//

import SwiftUI

@main
struct PETRO2App: App {
    @Environment(\.scenePhase) var scenePhase
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.locale, .init(identifier: "uk"))
//                .environment(\.locale, .init(languageComponents: .init(language: .init(identifier: "Ukrainian"))))
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.saveContext()
        }
    }
}
