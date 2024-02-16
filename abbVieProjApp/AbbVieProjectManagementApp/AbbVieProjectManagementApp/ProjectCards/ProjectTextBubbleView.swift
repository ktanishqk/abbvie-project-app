//
//  ProjectTextBubbleView.swift
//  AbbVieProjectManagementApp
//
//  Created by Sandoval-Luis, Alfredo on 2/16/24.
//

import SwiftUI

struct ProjectTextBubbleView: View {
    var namesOf: String
    
    var body: some View {
        HStack{
            Text(namesOf)
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.vertical, 8)
                //.background(Color.blue.opacity(1))
                .background(Color.white.opacity(0.2))
                .clipShape(Capsule())
                .fixedSize() // Fixed size capsule
                .frame(maxWidth: 100)
                .lineLimit(0) // Ensure only one line of text
                .truncationMode(.middle) // Replace overflowing text with ellipsis in the middle
            
            Spacer()
        }
    }
}

#Preview {
    ProjectTextBubbleView(namesOf: "Alfredo")
}
