//
//  HomePage.swift
//  AbbVieProjectManagementApp
//
//  Created by Khurana, Tanishq on 2/5/24.
//

import SwiftUI

struct HomePage: View {
    @Environment(\.managedObjectContext) var moc
    let abbvieBlue = Color(red: 7/255, green: 29/255, blue: 73/255)
    var gradient: Gradient {
        Gradient(colors: [abbvieBlue, abbvieBlue,.white])
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack {
                    
                    Spacer()
                    
                    VStack {
                        Image("Abbvie Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                            .padding(.top, 135)
                            .padding(.bottom, 45)
                        
                        NavigationLink(destination: EmployeeListView().environment(\.managedObjectContext, moc)) {
                            HomePageLinksView(text: "People")
                        }
                        .padding()
                        
                        NavigationLink(destination: ProjectListView().environment(\.managedObjectContext, moc)) {
                            HomePageLinksView(text: "Projects")
                        }
                        .padding()
                        NavigationLink(destination: ProfilePageView().environment(\.managedObjectContext, moc)) {
                            HomePageLinksView(text: "Profile Page")
                        }
                        .padding()
                    }
                    
                    Spacer()
                    
                }
                
                Spacer()
                
            }
            .background(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
        }
    }
}

#Preview {
    HomePage()
}
