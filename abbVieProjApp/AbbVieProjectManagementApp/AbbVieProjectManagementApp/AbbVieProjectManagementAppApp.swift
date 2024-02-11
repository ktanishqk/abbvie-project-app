//
//  AbbVieProjectManagementAppApp.swift
//  AbbVieProjectManagementApp
//
//  Created by Alfredo Sandoval-Luis on 2/2/24.
//

import SwiftUI

@main
struct AbbVieProjectManagementAppApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            // Leads to the home page and gives it the object context with the core data container's permission to access the core data stack
            HomePage()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
