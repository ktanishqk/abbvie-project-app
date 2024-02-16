//
//  AddEmployeeView.swift
//  AbbVieProjectManagementApp
//
//  Created by Sandoval-Luis, Alfredo on 2/9/24.
//

import SwiftUI

struct AddEmployeeView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Employee.entity(), sortDescriptors: []) var employees: FetchedResults<Employee>
    
    var project: Project
    @Binding var isPresented: Bool
    var onDismiss: () -> Void
    
    let positions = ["All"] + ["UX Designer", "Software Dev", "Front-End Dev", "Back-End Dev", "Project Manager"]
    @State private var selectedPosition = "All"
    @State private var filteredEmployees: [Employee] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Filter by Position", selection: $selectedPosition) {
                    ForEach(positions, id: \.self) { position in
                        Text(position)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Picker("Select Employee", selection: $selectedEmployee) {
                    ForEach(filteredEmployees, id: \.self) { employee in
                        Text(employee.wrappedEmployeeName)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .padding()
                
                Button("Add Employee") {
                    if let selectedEmployee = selectedEmployee {
                        selectedEmployee.addToProject(project)
                    }
                    try? moc.save()
                    isPresented = false
                    onDismiss()
                }
                .padding()
            }
            .navigationTitle("Add Employee")
            .onAppear {
                filteredEmployees = employees.filter { selectedPosition == "All" || $0.employeePosition == selectedPosition }
            }
            .onChange(of: selectedPosition) { _ in
                filteredEmployees = employees.filter { selectedPosition == "All" || $0.employeePosition == selectedPosition }
            }
        }
    }
    
    @State private var selectedEmployee: Employee?
}
