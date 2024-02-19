//
//  ProjectTextBubbleView.swift
//  AbbVieProjectManagementApp
//
//  Created by Sandoval-Luis, Alfredo on 2/16/24.
//

import SwiftUI

struct ProjectTextBubbleView: View {
    var text: String
    
    var body: some View {
        HStack{
            Text(text)
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color.white.opacity(0.2))
                .clipShape(Capsule())
                .frame(maxWidth: 100)
                //.fixedSize()
                //.lineLimit(1)
                //.truncationMode(.middle)
            
            Spacer()
        }
    }
}

#Preview {
    ProjectTextBubbleView(text: "Alfredo")
}
