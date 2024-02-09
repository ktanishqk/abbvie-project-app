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
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(projects, id: \.self) { project in
                            NavigationLink(destination: ProjectDetailsView(project: project)) {
                                HStack {
                                    Text(project.wrappedProjectName)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding()
                                        .frame(maxWidth: .infinity, minHeight: 150)
                                        .background(Color.blue)
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                        .navigationBarBackButtonHidden(true)
                                }
                                .padding(.horizontal)
                                .padding(.top, 10)
                            }
                        }
                    }
                }
                .padding()
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Project") {
                        isAddProjectViewPresented.toggle()
                    }
                }
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

