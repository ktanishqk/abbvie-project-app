//
//  ProjectDetailsView.swift
//  AbbVieProjectManagementApp
//
//  Created by Sandoval-Luis, Alfredo on 2/6/24.
//

import SwiftUI

struct ProjectDetailsView: View {
    var project: Project

    var body: some View {
        VStack {
            Text(project.wrappedProjectName)
                .font(.largeTitle)
                .padding()
        }
        .navigationBarTitle(Text(project.wrappedProjectName), displayMode: .inline)
    }
}
