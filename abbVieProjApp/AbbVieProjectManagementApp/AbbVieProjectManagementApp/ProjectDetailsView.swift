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
    // old
    @State private var employees: [Employee] = []
    
    // new
//    @FetchRequest var employees: FetchedResults<Employee>
    // new
//    init(project: Project) {
//        self.project = project
//        self._employees = FetchRequest(
//            entity: Employee.entity(),
//            sortDescriptors: [],
//            predicate: NSPredicate(format: "ANY project == %@", project)
//        )
//    }
    
    var body: some View {
        VStack {
            ScrollView{
                ProjectTextCardsView(text: "Project Name: \(project.wrappedProjectName)")
                    .padding(.vertical)
                
                ProjectTextCardsView(text: "Description: \(project.wrappedProjectDescription)")
                    .padding(.vertical)
                
                ProjectTextCardsView(text: "Start Date: \(dateFormatter(project.wrappedProjectStartDate))")
                    .padding(.vertical)
                
                ProjectTextCardsView(text: "End Date: \(dateFormatter(project.wrappedProjectEndDate))")
                    .padding(.vertical)
                
                HStack {
                    Text("Employees:")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    Button("Add Employee") {
                        isAddEmployeeViewPresented = true
                    }
                    .padding(.horizontal, 15)
                    .foregroundStyle(Color(red: 7/255, green: 29/255, blue: 73/255))
                }
                
                ForEach(employees, id: \.self) { employee in
                    NavigationLink(destination: EmployeeDetailsView(employee: employee)) {
                        ProjectTextCardsView(text: employee.wrappedEmployeeName)
                    }
                }
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
        // new
//        .sheet(isPresented: $isAddEmployeeViewPresented) {
//            AddEmployeeView(project: project, isPresented: $isAddEmployeeViewPresented, onDismiss: {})
//                .environment(\.managedObjectContext, moc)
//        }
        // old
        .sheet(isPresented: $isAddEmployeeViewPresented) {
            AddEmployeeView(project: project, isPresented: $isAddEmployeeViewPresented, onDismiss: {
                self.fetchEmployees(forProject: self.project)
            })
            .environment(\.managedObjectContext, moc)
        }
        .navigationTitle("Project Details")
        // old
        .onAppear{
            self.fetchEmployees(forProject: self.project)
        }
    }
    
    //
    // Manual fetch request currently not being used, replaced
    // by @fetchrequest in an attempt to fix refresh issue.
    // Everything commented is what made old fetch request work
    //
    private func fetchEmployees(forProject project: Project) {
        let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
        let predicate = NSPredicate(format: "ANY project == %@", project)
        fetchRequest.predicate = predicate

        do {
            let fetchedEmployees = try moc.fetch(fetchRequest)
            print("Fetched \(fetchedEmployees.count) employees for project \(project.wrappedProjectName)")
            DispatchQueue.main.async {
                self.employees = fetchedEmployees
            }
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
        
        return "\(formattedDate) \(dayOrdinal ?? ""), \(year)"
    }
    
}
