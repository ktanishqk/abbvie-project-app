//
//  ProjectCardView.swift
//  AbbVieProjectManagementApp
//
//  Created by Sandoval-Luis, Alfredo on 2/16/24.
//

import SwiftUI

struct ProjectCardView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\Project.projectEndDate, order: .forward)
    ]) var projects: FetchedResults<Project>
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(projects, id: \.self) { project in
                    NavigationLink(destination: ProjectDetailsView(project: project)) {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(project.wrappedProjectName)
                                    .font(.title)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Image(systemName: "calendar")
                                    .foregroundColor(.white)
                                
                                Text(ProjectCardView.formatDate(date: project.wrappedProjectEndDate))
                                    .foregroundColor(.white)
                            }
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(project.employeeArray.chunked(into: 3), id: \.self) { chunk in
                                    HStack(spacing: 0) {
                                        ForEach(chunk, id: \.self) { employee in
                                            ProjectTextBubbleView(text: employee.wrappedEmployeeFirstName)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 0)
                            .multilineTextAlignment(.leading)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 7/255, green: 29/255, blue: 73/255))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                    }
                }
            }
        }

    }
    static func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        return dateFormatter.string(from: date)
    }
    
// IS NOT currently being used
//
//    func deleteProjects(at offsets: IndexSet) {
//        for offset in offsets {
//            let project = projects[offset]
//            moc.delete(project)
//        }
//        
//        try? moc.save()
//    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
