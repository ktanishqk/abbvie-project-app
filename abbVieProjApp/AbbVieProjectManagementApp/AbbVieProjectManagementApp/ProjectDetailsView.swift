//
//  ProjectDetailsView.swift
//  AbbVieProjectManagementApp
//
//  Created by Sandoval-Luis, Alfredo on 2/6/24.
//

import SwiftUI

struct ProjectDetailsView: View {
    @Environment(\.managedObjectContext) private var moc
    @State private var isAddEmployeeViewPresented = false
    @ObservedObject var project: Project
    @State private var employees: [Employee] = []
    
    var body: some View {
        VStack {
            ScrollView{
                ProjectTextCardsView(text: "Project Name: \(project.wrappedProjectName)")
                    .padding(.vertical)
                
                ProjectTextCardsView(text: "Project Description: \(project.wrappedProjectDescription)")
                    .padding(.vertical)
                
                ProjectTextCardsView(text: "Project Start Date: \(dateFormatter(project.wrappedProjectStartDate))")
                    .padding(.vertical)
                
                ProjectTextCardsView(text: "Project End Date: \(dateFormatter(project.wrappedProjectEndDate))")
                    .padding(.vertical)
                
                Text("Employees:")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ForEach(employees, id: \.self) { employee in
                    ProjectTextCardsView(text: employee.wrappedEmployeeName)
                }
            }
        }
        //.navigationBarHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Add Employee") {
                    isAddEmployeeViewPresented = true
                }
            }
        }
        .sheet(isPresented: $isAddEmployeeViewPresented) {
            AddEmployeeView(isPresented: $isAddEmployeeViewPresented, onDismiss: fetchEmployees)
            .environment(\.managedObjectContext, moc)
        }
        .navigationTitle("Project Details")
        .onAppear(perform: fetchEmployees)
    }
    
    private func fetchEmployees() {
        do {
            employees = try moc.fetch(Employee.fetchRequest())
        } catch {
            print("Error fetching projects: \(error.localizedDescription)")
        }
    }
    
    func dateFormatter(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        
        let dayOfMonth = Calendar.current.component(.day, from: date)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .ordinal
        let dayOrdinal = numberFormatter.string(from: NSNumber(value: dayOfMonth))
        
        let formattedDate = formatter.string(from: date)
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: date)
        
        return "\(formattedDate) \(dayOrdinal ?? "") \(year)"
    }
    
}
