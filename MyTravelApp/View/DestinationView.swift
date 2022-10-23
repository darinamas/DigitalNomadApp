//
//  DestinationView.swift
//  MyTravelApp
//
//  Created by Daryna Polevyk on 23.10.2022.
//

import SwiftUI
import PhotosUI

struct DestinationView: View {
    @State private var listOfInfo = ["Tickets", "Apartments", "Mexico", "Dominicana"]
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            ScrollView (.horizontal) {
                LazyHStack {
                    ForEach(listOfInfo, id: \.self) {info in
                        CityView(label: info, image: "WoodTile")
                    }.padding()
                }.frame(height: 200)
            }
            PhotoPickerView()
            Spacer()
        }
    }
}

struct DestinationView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationView()
    }
}


@available(iOS 16.0, *)
struct PhotoPickerView: View {
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State var contentMode = ContentMode.fit
    
    var body: some View {
        
        PhotosPicker(
            selection: $selectedItem,
            matching: .images,
            photoLibrary: .shared()) {
                Text("Select a photo")
            }
            .onChange(of: selectedItem) { newItem in
                Task {
                    // Retrieve selected asset in the form of Data
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }
        
        if let selectedImageData,
           let uiImage = UIImage(data: selectedImageData) {
            
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .onTapGesture {
                    withAnimation {
                        self.contentMode = ContentMode.fill
                    }
                }
        }
    }
}

//struct FullScreenModalView: View {
//    @Environment(\.presentationMode) var presentationMode
//
//    var body: some View {
//        ZStack {
//            Color.primary.edgesIgnoringSafeArea(.all)
//            Button("Dismiss Modal") {
//                presentationMode.wrappedValue.dismiss()
//            }
//        }
//    }
//}
