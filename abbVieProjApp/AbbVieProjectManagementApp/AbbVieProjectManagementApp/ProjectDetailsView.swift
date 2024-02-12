//
//  ProjectDetailsView.swift
//  AbbVieProjectManagementApp
//
//  Created by Sandoval-Luis, Alfredo on 2/6/24.
//

import SwiftUI
import CoreData

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
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Add Employee") {
                    isAddEmployeeViewPresented = true
                }
            }
        }
        .sheet(isPresented: $isAddEmployeeViewPresented) {
            AddEmployeeView(project: project, isPresented: $isAddEmployeeViewPresented, onDismiss: {
                self.fetchEmployees(forProject: self.project)
            })
            .environment(\.managedObjectContext, moc)
        }
        .navigationTitle("Project Details")
        .onAppear{
            self.fetchEmployees(forProject: self.project)
        }
    }
    
    
    private func fetchEmployees(forProject project: Project) {
        let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
        let predicate = NSPredicate(format: "ANY project == %@", project)
        fetchRequest.predicate = predicate

        do {
            let fetchedEmployees = try moc.fetch(fetchRequest)
            print("Fetched \(fetchedEmployees.count) employees for project \(project.wrappedProjectName)")
            self.employees = fetchedEmployees
        } catch {
            print("Error fetching employees for project: \(error.localizedDescription)")
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
