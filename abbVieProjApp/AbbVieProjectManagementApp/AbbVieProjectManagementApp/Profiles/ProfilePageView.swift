//
//  ProfilePageView.swift
//  AbbVieProjectManagementApp
//
//  Created by Sandoval-Luis, Alfredo on 2/21/24.
//

import SwiftUI

struct ProfilePageView: View {
    @Environment(\.managedObjectContext) var moc
    let abbvieBlue = Color(red: 7/255, green: 29/255, blue: 73/255)
    var gradient: Gradient {
        Gradient(colors: [abbvieBlue, .white])
    }
    
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
                        .padding(.top, 135)
                    
                    Text("Alfredo Sandoval-Luis")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)
                    
                    Text("iOS Dev Intern")
                        .foregroundStyle(.white)
                }
                Spacer()
            }
            Spacer()
        }
        .background(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
        //.background(Color(red: 7/255, green: 29/255, blue: 73/255))
    }
    
}

#Preview {
    ProfilePageView()
}
