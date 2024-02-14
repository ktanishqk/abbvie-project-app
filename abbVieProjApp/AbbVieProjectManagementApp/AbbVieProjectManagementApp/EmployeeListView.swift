//
//  EmployeeListView.swift
//  AbbVieProjectManagementApp
//
//  Created by Khurana, Tanishq on 2/13/24.
//
//  Was previously ContentView, split into
//  ProjectListView and EmployeeListView
//
import SwiftUI

struct EmployeeListView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @FetchRequest(
        entity: Employee.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Employee.employeeName, ascending: true)
        ]
    ) var employees: FetchedResults<Employee>

    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(employees.filter { searchText.isEmpty || $0.wrappedEmployeeName.localizedCaseInsensitiveContains(searchText) }) { employee in
                    NavigationLink(destination: EmployeeDetailsView(employee: employee)) {
                        Text(employee.wrappedEmployeeName)
                    }
                }
                .onDelete(perform: deleteEmployees)
            }
            .searchable(text: $searchText)
            .navigationTitle("Employees")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                }
            }
        }
    }
    
    func deleteEmployees(at offsets: IndexSet) {
        for offset in offsets {
            let employee = employees[offset]
            moc.delete(employee)
        }
        try? moc.save()
    }
}
