//
//  CreatePlaceView.swift
//  PETRO2
//
//  Created by mac on 16.03.2023.
//

import SwiftUI
import UIKit

struct CreatePlaceView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var country: String = ""
    @State private var notes: String = ""

    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    
    var newPlaceAddFunc: (_ place: FavoritePlace) -> Void = { place in }
    
    var body: some View {
        VStack {
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 300, height: 300)
            } else {
                Image(systemName: "plus.circle")
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 300, height: 300)
                    .background(Color.pink.opacity(0.2))
            }
            HStack {
                Button("Camera") {
                    self.sourceType = .camera
                    self.isImagePickerDisplay.toggle()
                }.padding()
                
                Button("photo") {
                    self.sourceType = .photoLibrary
                    self.isImagePickerDisplay.toggle()
                }.padding()
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple.opacity(0.7))
            
            Divider()
            TextField("Name", text: $name)
            Divider()
            TextField("Country", text: $country)
            Divider()
            TextField("Notes", text: $notes)
            Divider()
            
            Button("Add place") {
                addNewPlace()
                presentationMode.wrappedValue.dismiss()
            }
            .buttonStyle(.bordered)
            .tint(.pink)
            .frame(width: 300, height: 80, alignment: .center)
        }
        .sheet(isPresented: self.$isImagePickerDisplay) {
            ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
        }
        
    }
    
    func addNewPlace() {
        print(name, country, notes)
        guard !name.isEmpty && !country.isEmpty else { return }
        let data = self.selectedImage?.jpegData(compressionQuality: 1.0)
        let place = FavoritePlace(name: name, country: country, notes: notes, imageData: data)
        self.newPlaceAddFunc(place)
    }
}

struct CreatePlaceView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePlaceView()
    }
}
