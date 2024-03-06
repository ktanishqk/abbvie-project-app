//
//  HomePageLinksView.swift
//  AbbVieProjectManagementApp
//
//  Created by Sandoval-Luis, Alfredo on 2/14/24.
//

import SwiftUI

struct HomePageLinksView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .frame(width: 200)
            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
            .background(.white)
            .foregroundColor(Color(red: 7/255, green: 29/255, blue: 73/255))
            .cornerRadius(20)
            .font(.largeTitle)
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    HomePageLinksView(text: "GoToPage")
}
