//
//  LoginView.swift
//  AbbVieProjectManagementApp
//
//  Created by Sandoval-Luis, Alfredo on 2/26/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @Binding var isSignedIn: Bool
    
    var body: some View {
        NavigationStack{
            VStack{
                // image
                Image("Abbvie Logo")
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(10)
                    .frame(width: 200, height:200)
                    .offset(y: 15)
                    .padding(.vertical, 32)
                
                // form fields
                VStack(spacing: 34){
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@exmaple.com")
                    .autocapitalization(.none)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter Password",
                              isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 90)
                
                
                // sign-in button
                Button {
                    isSignedIn = true
                } label: {
                    HStack{
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(red: 7/255, green: 29/255, blue: 73/255))
                //simple form validation ui
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                // help button
                HStack{
                    Text("Need Help?")
                        .fontWeight(.bold)
                }
                .foregroundStyle(Color(red: 55/255, green: 95/255, blue: 170/255))
                .font(.system(size: 16))
            }
        }
    }
}


// MARK: - Form validation protocol

extension LoginView {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView(isSignedIn: .constant(false))
}
