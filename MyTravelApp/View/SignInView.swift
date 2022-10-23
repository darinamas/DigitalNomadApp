//
//  SignInView.swift
//  MyTravelApp
//
//  Created by Daryna Polevyk on 23.10.2022.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            VStack (alignment: .leading) {
                HStack {
                    Text("Log In")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                    Spacer()
                }.padding()
                Text("Enter your email for Log In.")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.gray)
                    .padding()
                NavigationLink(destination: CreateAccount())  {
                    Text("Create Account")
                        .foregroundColor(.blue)
                        .padding()
                }
            }
            
            VStack {
                TextField(
                    "Email",
                    text: $email
                ).onChange(of: email) { email in
                    // self.saveEmail = email
                    // print("Saved 🦊: \(saveEmail)")
                }
                
                TextField(
                    "Password",
                    text: $password
                )
            }.textFieldStyle(.roundedBorder)
                .padding()
            NavigationLink(destination: EmptyView()) {
                Text("Register")
                    .padding()
                    .font(.title)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(30)
                
            }.padding()
            Image("Tourist")
                .resizable()
                .scaledToFit()
            
        
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignInView()
            SignInView()
                .environment(\.colorScheme, .dark)
        }
    }
}
