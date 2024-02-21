//
//  GenerateEmployee.swift
//  AbbVieProjectManagementApp
//
//  Created by Khurana, Tanishq on 2/16/24.
//

import SwiftUI

struct GenerateEmployeeView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Project.entity(), sortDescriptors: []) var projects: FetchedResults<Project>

    @State private var employeeName = ""
    @State private var employeePosition = ""

    var project: Project
    let positions = ["UX Designer", "Softwre Dev", "Front-End Dev", "Back-End Dev", "Project Manager"]

    @Binding var isPresented: Bool
    var onDismiss: () -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Employee Name", text: $employeeName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Picker("Position", selection: $employeePosition) {
                        ForEach(positions, id:\.self) {
                            Text($0)
                        }
                    }
                }

                Button("Add Employee") {
                    let newEmployee = Employee(context: moc)
                    newEmployee.employeeName = employeeName
                    newEmployee.employeePosition = employeePosition
                    newEmployee.employeeId = UUID()

                    // add the current project to the new employees project set
                    //newEmployee.addToProject(project)

                    try? moc.save()

                    employeeName = ""
                    isPresented = false
                    onDismiss()
                }
                .padding()
            }
            .navigationTitle("Add Employee")
        }
    }
}
