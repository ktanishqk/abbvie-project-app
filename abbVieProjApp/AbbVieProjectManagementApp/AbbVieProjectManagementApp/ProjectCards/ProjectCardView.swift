//
//  ProjectCardView.swift
//  AbbVieProjectManagementApp
//
//  Created by Sandoval-Luis, Alfredo on 2/16/24.
//

import SwiftUI

struct ProjectCardView: View {
    
    var projectTitle: String
    var employeeNames: [String]
    var projectEndDate: Date
    
    init(projectTitle: String, employeeNames: [String], projectEndDate: String) {
        self.projectTitle = projectTitle
        self.employeeNames = employeeNames
        self.projectEndDate = ProjectCardView.date(from: projectEndDate)
    }
    
    static func date(from dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        return dateFormatter.date(from: dateString) ?? Date()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(projectTitle)
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: "calendar")
                    .foregroundColor(.white)
                
                Text(ProjectCardView.formatDate(date: projectEndDate))
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                ForEach(employeeNames.chunked(into: 3), id: \.self) { chunk in
                    HStack(spacing: 0) {
                        ForEach(chunk, id: \.self) { employeeName in
                            ProjectTextBubbleView(namesOf: employeeName)
                        }
                    }
                }
            }
            .padding(.horizontal, 0)
            .multilineTextAlignment(.leading)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
    static func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        return dateFormatter.string(from: date)
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}

#Preview {
    ProjectCardView(projectTitle: "Project title", employeeNames: ["Alfredo", "Tanishq", "Nick", "Jessica"], projectEndDate: "Apr 02")
}
