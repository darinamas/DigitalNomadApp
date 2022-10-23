//
//  CreateAccount.swift
//  MyTravelApp
//
//  Created by Daryna Polevyk on 22.10.2022.
//

import SwiftUI

struct CreateAccount: View {
    @State private var email: String = ""
    @State private var mobil: String = ""
    @State private var password: String = ""
    @State private var password2: String = ""
    
    @AppStorage("EMAIL_KEY") var saveEmail = ""
    
    var body: some View {
        VStack{
            VStack {
                VStack (alignment: .leading) {
                    Text("Create Account")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                    Text("Enter your email, phone number and password for register.")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                    NavigationLink(destination: SignInView())  {
                        Text("Already have account?")
                            .foregroundColor(.blue)
                    }.padding(.top, 20)

                    
                }.padding()
                VStack {
                    TextField(
                        "Email",
                        text: $email
                    ).onChange(of: email) { email in
                        self.saveEmail = email
                        print("Saved 🦊: \(saveEmail)")
                    }
                    
                    TextField(
                        "Mobil",
                        text: $mobil
                    )
                    TextField(
                        "Password",
                        text: $password
                    )
                    TextField(
                        "Confirm Password",
                        text: $password2
                    )
                }
                .textFieldStyle(.roundedBorder)
                .padding()
                NavigationLink(destination: HomeView()) {
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
        //}
    }
}

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        CreateAccount()
        CreateAccount()
            .environment(\.colorScheme, .dark)
        }
    }
}
