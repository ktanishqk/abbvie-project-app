//
//  DataController.swift
//  AbbVieProjectManagementApp
//
//  Created by Alfredo Sandoval-Luis on 2/2/24.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "AbbVieProjectManagementApp")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
