//
//  ContentView.swift
//  AbbVieProjectManagementApp
//
//  Created by Alfredo Sandoval-Luis on 2/2/24.
//
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var projects: [Project] = []
    @State private var isAddProjectViewPresented = false

    var body: some View {
        NavigationView {
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

                Button("Add Project") {
                    isAddProjectViewPresented.toggle()
                }
                .padding()
            }
            .sheet(isPresented: $isAddProjectViewPresented) {
                AddProjectView(isPresented: $isAddProjectViewPresented, onDismiss: fetchProjects)
                    .environment(\.managedObjectContext, moc)
            }
            .navigationTitle("Project Management")
            .onAppear(perform: fetchProjects)
        }
    }

    // Function to fetch projects
    private func fetchProjects() {
        do {
            projects = try moc.fetch(Project.fetchRequest())
        } catch {
            print("Error fetching projects: \(error.localizedDescription)")
        }
    }
}

