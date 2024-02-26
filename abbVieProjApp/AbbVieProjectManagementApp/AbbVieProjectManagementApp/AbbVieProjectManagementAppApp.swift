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
    @State private var isSignedIn = false
    
    var body: some Scene {
        WindowGroup {
            if isSignedIn {
                HomePage()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
            } else {
                // Pass the isSignedIn binding to the LoginView
                LoginView(isSignedIn: $isSignedIn)
            }
        }
    }
}
