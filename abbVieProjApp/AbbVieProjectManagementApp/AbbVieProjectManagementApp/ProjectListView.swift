//
//  ProjectListView.swift
//  AbbVieProjectManagementApp
//
//  Created by Khurana, Tanishq on 2/13/24.
//
//  Was previously ContentView, split into
//  ProjectListView and EmployeeListView
//
import SwiftUI

struct ProjectListView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var isAddProjectViewPresented = false
    
    var body: some View {
        NavigationStack {
            ProjectCardView()
            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    EditButton()
//                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isAddProjectViewPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddProjectViewPresented) {
                AddProjectView(isPresented: $isAddProjectViewPresented, onDismiss: {})
                .environment(\.managedObjectContext, moc)
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}
