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
            HomePage()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
