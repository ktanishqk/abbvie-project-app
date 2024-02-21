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
    @State private var isGenerateEmployeeSheetPresented = false

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
            //.navigationTitle("Employees")
            .toolbar {
                ToolbarItem {
                    Menu {
                        Button("Generate Employee") {
                            isGenerateEmployeeSheetPresented = true
                        }
                        EditButton()
                    } label: {
                        Label("Menu", systemImage: "ellipsis.circle")
                            .foregroundStyle(Color(red: 7/255, green: 29/255, blue: 73/255))
                    }
                    .menuOrder(.fixed)
                }
            }
            .sheet(isPresented: $isGenerateEmployeeSheetPresented) {
                GenerateEmployeeView(project: Project(), isPresented: $isGenerateEmployeeSheetPresented, onDismiss: {})
                    .environment(\.managedObjectContext, moc)
            }

        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
    
    func deleteEmployees(at offsets: IndexSet) {
        for offset in offsets {
            let employee = employees[offset]
            moc.delete(employee)
        }
        try? moc.save()
    }
}
