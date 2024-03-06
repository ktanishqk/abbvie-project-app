//
//  ProfilePageView.swift
//  AbbVieProjectManagementApp
//
//  Created by Sandoval-Luis, Alfredo on 2/21/24.
//

import SwiftUI

struct ProfilePageView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let abbvieBlue = Color(red: 7/255, green: 29/255, blue: 73/255)
    var gradient: Gradient {
        Gradient(colors: [abbvieBlue, abbvieBlue, .white])
    }
    // examples
    var projects: [String] = ["Project 1", "Project 2", "Project 3"]
    
    var body: some View {
        VStack {
            HStack {
                
                Spacer()
                VStack {
                    Image("AlfredoSandoval-LuisBusiness")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .clipped()
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .padding(.top, 65)
                    
                    Text("Alfredo Sandoval-Luis")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)
                    
                    Text("iOS Dev Intern")
                        .foregroundStyle(.white)
                }
                Spacer()
            }
            .padding(.bottom, 10)
            
            ScrollView {
                MockEmpProjView(projectTitle: "UI View", employeeNames: ["Alfredo", "Tanishq", "Nick", "Jessica"], projectEndDate: "Apr 02")
                
                MockEmpProjView(projectTitle: "App One", employeeNames: ["Alfredo", "Tanishq", "Nick", "Keng", "Rupen", "Li"], projectEndDate: "Jun 21")
                
                MockEmpProjView(projectTitle: "Refresh Test", employeeNames: ["Alfredo", "Tanishq"], projectEndDate: "May 14")
            }
            
            Spacer()
        }
        .background(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
        //.background(Color(red: 7/255, green: 29/255, blue: 73/255))
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:         Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundStyle(.white)
        })
    }
    
}

#Preview {
    ProfilePageView()
}
