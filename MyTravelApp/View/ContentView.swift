//
//  ContentView.swift
//  MyTravelApp
//
//  Created by Daryna Polevyk on 22.10.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("White")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Spacer()
                    VStack (alignment: .leading) {
                        Text("Enjoy your holiday with Visit")
                            .padding()
                        Text("Keep you travell very comfortable, easy and explorer the buton.")
                            .padding()
                            .foregroundColor(.gray)
                        NavigationLink(destination: CreateAccount()) {
                            Text("Explore")
                                .padding()
                                .font(.title)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(30)
                            
                        }.padding()
                        
                    }
                    Spacer()
                    Image("Family")
                        .resizable()
                        .scaledToFit()
                    
                    
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
