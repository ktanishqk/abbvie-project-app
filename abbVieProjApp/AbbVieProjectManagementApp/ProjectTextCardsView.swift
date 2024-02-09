//
//  ProjectTextCardsView.swift
//  AbbVieProjectManagementApp
//
//  Created by Sandoval-Luis, Alfredo on 2/9/24.
//

import SwiftUI

struct ProjectTextCardsView: View {
    var text: String

    var body: some View {
        Text(text)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.horizontal)
    }
}

#Preview {
    ProjectTextCardsView(text: "alfredo")
}
