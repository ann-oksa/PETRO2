//
//  PlaceView.swift
//  PETRO2
//
//  Created by mac on 16.03.2023.
//
import SwiftUI

struct PlaceView: View {
// MARK: - Internal properties
    var place: FavoritePlace
    
// MARK: - Body
    var body: some View {
        ZStack {
            Color.purple.opacity(0.1)
                .ignoresSafeArea()
            VStack {
                Text(place.name)
                    .padding(.bottom, 120)
                    .frame(height: 30)
                    .bold()
                Image(uiImage: UIImage(data: place.imageData ?? Data()) ?? UIImage())
                    .resizable()
                    .frame(width: 400, height: 400, alignment: .center)
                Text(place.country)
                    
                Divider()
                Text(place.notes)
            }
            .padding()
        }
    }
}

struct PlaceView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceView(place: FavoritePlace(name: "Eiffel Tower", country: "Paris", notes: "Too crowded, too expensive", imageName: "eiffelTower"))
    }
}
