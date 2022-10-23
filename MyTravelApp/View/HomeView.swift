//
//  HomeView.swift
//  MyTravelApp
//
//  Created by Daryna Polevyk on 23.10.2022.
//

import SwiftUI

struct HomeView: View {
    @State private var listOfStates = ["Prague", "London", "Mexico", "Dominicana"]
    
    var body: some View {
        VStack{
            VStack{
                HStack {
                    Image("Avatar")
                        .resizable()
                        .frame(width: 32.0, height: 32.0)
                    Text("Welcome, Darinka!")
                    Spacer()
                    
                }.padding()
                HStack{
                    Text("Travel list")
                        .font(.largeTitle)
                        .padding()
                    Spacer()
                }
                ScrollView (.horizontal) {
                    LazyHStack {
                        ForEach(listOfStates, id: \.self) {state in
                            CityView(label: state, image: "WoodTile")
                        }.padding()
                    }.frame(height: 300)
                }
                ScrollView (.horizontal) {
                    LazyHStack {
                        ForEach(listOfStates, id: \.self) {state in
                            CityView(label: state, image: "TravelTile")
                        }.padding()
                    }.frame(height: 200)
                    
                }
                Spacer()
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct CityView: View {
    @State var label:String
    @State var image: String
    
    var body: some View {
        NavigationLink(destination: EmptyView()){
        ZStack{
            Image(image)
                .resizable()
                .scaledToFit()
            Text(label)
                .foregroundColor(.white)
                .font(.largeTitle)
        }
        }
    }
}
