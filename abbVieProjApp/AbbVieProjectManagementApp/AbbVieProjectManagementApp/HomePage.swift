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
                    Spacer()
                    
                    NavigationLink(destination: EmployeeListView()) {
                                        Text("View Employees")
                                            .padding()
                                            .background(Color.blue)
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                    }
                                    .padding()
                    
                    NavigationLink(destination: ProjectListView().environment(\.managedObjectContext, moc)) {
                        Text("View Projects")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                .edgesIgnoringSafeArea(.top)
            }
        }
    }
