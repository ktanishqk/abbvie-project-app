//
//  AddProjectView.swift
//  AbbVieProjectManagementApp
//
//  Created by Alfredo Sandoval-Luis on 2/2/24.
//

import SwiftUI

struct AddProjectView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Employee.entity(), sortDescriptors: []) var employees: FetchedResults<Employee>

    @State private var projectName = ""
    @State private var projectDescription = ""
    @State private var projectEndDate = Date()
    @State private var selectedEmployees: Set<Employee> = []
    @Binding var isPresented: Bool
    var onDismiss: () -> Void

    var body: some View {
        NavigationView {
            VStack {
                TextField("Project Name", text: $projectName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Project Description", text: $projectDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                DatePicker("End Date", selection: $projectEndDate, displayedComponents: .date)
                    .padding()

                List(employees, id: \.self) { employee in
                    HStack {
                        Text(employee.wrappedEmployeeName)
                        Spacer()
                        if selectedEmployees.contains(employee) {
                            Image(systemName: "checkmark")
                        }
                    }
                    .onTapGesture {
                        toggleEmployeeSelection(employee)
                    }
                }

                Button("Add Project") {
                    let newProject = Project(context: moc)
                    newProject.projectName = projectName
                    newProject.projectDescription = projectDescription
                    newProject.projectEndDate = projectEndDate
                    newProject.addToEmployee(selectedEmployees as NSSet)

                    try? moc.save()

                    projectName = ""
                    projectDescription = ""
                    selectedEmployees.removeAll()
                    isPresented = false
                    onDismiss()
                }
                .padding()
            }
            .navigationTitle("Project Details")
        }
    }

    private func toggleEmployeeSelection(_ employee: Employee) {
        if selectedEmployees.contains(employee) {
            selectedEmployees.remove(employee)
        } else {
            selectedEmployees.insert(employee)
            
        }
    }
}



