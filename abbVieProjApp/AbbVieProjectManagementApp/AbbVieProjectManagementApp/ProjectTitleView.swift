//
//  ProjectTitleView.swift
//  AbbVieProjectManagementApp
//
//  Created by Sandoval-Luis, Alfredo on 2/12/24.
//

import SwiftUI

struct ProjectTitleView: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.title)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity, minHeight: 50) // Adjust height as needed
            .background(Color.blue)
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

#Preview {
    ProjectTitleView(text: "ProjectName")
}
