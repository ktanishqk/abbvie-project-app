//
//  MockEmpProjView.swift
//  AbbVieProjectManagementApp
//
//  Created by Sandoval-Luis, Alfredo on 3/6/24.
//

import SwiftUI

struct MockEmpProjView: View {
    var projectTitle = ""
    var employeeNames = [""]
    var projectEndDate = ""
    
    let abbvieBlue = Color(red: 7/255, green: 29/255, blue: 73/255)
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(projectTitle)
                    .font(.title2)
                    .foregroundColor(abbvieBlue)
                
                Spacer()
                
                Image(systemName: "calendar")
                    .foregroundColor(abbvieBlue)
                
                Text(projectEndDate)
                    .foregroundColor(abbvieBlue)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                ForEach(employeeNames.chunked(into: 3), id: \.self) { chunk in
                    HStack(spacing: 0) {
                        ForEach(chunk, id: \.self) { employeeName in
                            MockTextBubbleView(namesOf: employeeName)
                        }
                    }
                }
            }
            .padding(.horizontal, 0)
            .multilineTextAlignment(.leading)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        .padding()
    }
}

#Preview {
    MockEmpProjView(projectTitle: "Project title", employeeNames: ["Alfredo", "Tanishq", "Nick", "Jessica"], projectEndDate: "Apr 02")
}
