//
//  PlaceRow.swift
//  PETRO2
//
//  Created by mac on 16.03.2023.
//

import SwiftUI

struct PlaceRow: View {
// MARK: - Internal properties
    var place: FavoritePlace
    
// MARK: - Body
    var body: some View {
        HStack {
            Image(uiImage: UIImage(data: place.imageData ?? Data()) ?? UIImage())
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
            Text(place.name)
            Spacer()
        }
    }
}

struct PlaceRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlaceRow(place: FavoritePlace(name: "Eiffel Tower", country: "Paris", notes: "Too crowded, too expensive", imageName: "eiffelTower"))
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
