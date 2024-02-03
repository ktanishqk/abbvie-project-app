//
//  ContentView.swift
//  AbbVieProjectManagementApp
//
//  Created by Alfredo Sandoval-Luis on 2/2/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var projects: FetchedResults<Project>
    
    var body: some View {
        VStack {
            List {
                ForEach(projects, id: \.self) { project in
                    Section(project.wrappedProjectName) {
                        ForEach(project.employeeArray, id: \.self) { employee in
                            Text(employee.wrappedEmployeeName)
                        }
                    }
                }
            }
            
            Button("Add Examples") {
                let employee1 = Employee(context: moc)
                employee1.employeeName = "Alfredo"
                
                let project1 = Project(context: moc)
                project1.projectName = "Swift App"
                project1.addToEmployee(employee1)
                
                let employee2 = Employee(context: moc)
                employee2.employeeName = "Tanishq"
                
                let project2 = Project(context: moc)
                project2.projectName = "React App"
                project2.addToEmployee(employee2)
                
                try? moc.save()
            }
        }
    }
}

#Preview {
    ContentView()
}
