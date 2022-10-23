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
       // ZStack {
            //Color("White")
            //    .edgesIgnoringSafeArea(.all)
        VStack{
            VStack {
                VStack (alignment: .leading) {
                    Text("Create Account")
                        .foregroundColor(.black)
                    Text("Enter your email, phone number and password for register. Already have account?")
                        .foregroundColor(.black)
                    
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
                    ).background(Color.red)
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
