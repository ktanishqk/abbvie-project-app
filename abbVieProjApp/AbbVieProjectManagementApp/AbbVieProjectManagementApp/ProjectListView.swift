//
//  ContentView.swift
//  AbbVieProjectManagementApp
//
//  Created by Alfredo Sandoval-Luis on 2/2/24.
//
import SwiftUI

struct ProjectListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\Project.projectName, order: .forward)
    ]) var projects: FetchedResults<Project>
    @State private var isAddProjectViewPresented = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(projects, id: \.self) { project in
                    NavigationLink(destination: ProjectDetailsView(project: project)) {
                        HStack {
                            ProjectTitleView(text: project.wrappedProjectName)
                        }
                    }
                }
                .onDelete(perform: deleteProjects)
            }
            .navigationTitle("Project Management")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Project") {
                        isAddProjectViewPresented.toggle()
                    }
                }
            }
            .sheet(isPresented: $isAddProjectViewPresented) {
                AddProjectView(isPresented: $isAddProjectViewPresented, onDismiss: {
                    // This closure is called when AddProjectView is dismissed.
                })
                .environment(\.managedObjectContext, moc)
            }
        }
    }
    
    func deleteProjects(at offsets: IndexSet) {
        for offset in offsets {
            let project = projects[offset]
            moc.delete(project)
        }
        
        try? moc.save()
    }
}
