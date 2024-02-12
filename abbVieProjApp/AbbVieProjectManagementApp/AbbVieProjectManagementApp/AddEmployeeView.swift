//
//  AddEmployeeView.swift
//  AbbVieProjectManagementApp
//
//  Created by Sandoval-Luis, Alfredo on 2/9/24.
//

import SwiftUI

struct AddEmployeeView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Project.entity(), sortDescriptors: []) var projects: FetchedResults<Project>
    
    @State private var employeeName = ""
    
    var project: Project
    
    @Binding var isPresented: Bool
    var onDismiss: () -> Void
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Employee Name", text: $employeeName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Add Employee") {
                    let newEmployee = Employee(context: moc)
                    newEmployee.employeeName = employeeName
                    newEmployee.employeeId = UUID()
                    
                    // add the current project to the new employees project set
                    newEmployee.addToProject(project)
                    
                    try? moc.save()
                    
                    employeeName = ""
                    isPresented = false
                    onDismiss()
                }
                .padding()
            }
            .navigationTitle("Generate Employee")
        }
    }
}
