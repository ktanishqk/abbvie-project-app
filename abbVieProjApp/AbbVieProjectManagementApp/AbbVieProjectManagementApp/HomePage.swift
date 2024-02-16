//
//  HomePage.swift
//  AbbVieProjectManagementApp
//
//  Created by Khurana, Tanishq on 2/5/24.
//

import SwiftUI

struct HomePage: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("Abbvie Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
                Spacer()
                
                NavigationLink(destination: EmployeeListView().environment(\.managedObjectContext, moc)) {
                    HomePageLinksView(text: "Employees")
                }
                .padding()
                
                NavigationLink(destination: ProjectListView().environment(\.managedObjectContext, moc)) {
                    HomePageLinksView(text: "Projects")
                }
                .padding()
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}
