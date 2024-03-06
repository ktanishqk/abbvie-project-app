//
//  MockTextBubbleView.swift
//  AbbVieProjectManagementApp
//
//  Created by Sandoval-Luis, Alfredo on 3/6/24.
//

import SwiftUI

struct MockTextBubbleView: View {
    var namesOf: String
    
    let abbvieBlue = Color(red: 7/255, green: 29/255, blue: 73/255)
    
    var body: some View {
        HStack{
            Text(namesOf)
                .foregroundColor(abbvieBlue)
                .padding(.horizontal)
                .padding(.vertical, 8)
                //.background(Color.blue.opacity(1))
                .background(Color.gray.opacity(0.5))
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
    MockTextBubbleView(namesOf: "Alfredo")
}
