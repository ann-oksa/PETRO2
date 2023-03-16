//
//  PlaceModel.swift
//  PETRO2
//
//  Created by mac on 16.03.2023.
//

import SwiftUI
import CoreData

struct FavoritePlace: Identifiable {
    var id = UUID()
    var name: String
    var country: String
    var notes: String
    var imageData: Data?
    var imageName: String?
//    var image: Image {
//        Image(imageName)
//    }
}
