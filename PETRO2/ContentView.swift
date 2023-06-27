//
//  ContentView.swift
//  PETRO2
//
//  Created by mac on 16.03.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - Private properties
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Place.id, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Place>
    @State private var addingPlace = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.cyan.opacity(0.1)
                .ignoresSafeArea()
            NavigationView {
                List {
                    ForEach(items) { place in
                        NavigationLink {
                            let somePlace = FavoritePlace(name: place.name ?? "", country: place.country ?? "", notes: place.notes ?? "", imageData: place.image, imageName: "")
                            PlaceView(place: somePlace)
                        } label: {
                            let somePlace = FavoritePlace(name: place.name ?? "", country: place.country ?? "", notes: place.notes ?? "", imageData: place.image, imageName: "")
                            PlaceRow(place: somePlace)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .navigationTitle("Favorite Places")
                .toolbar {
                    Button {
                        addingPlace.toggle()
                    } label: {
                        Label("User Profile", systemImage: "plus.circle")
                    }
                }
                .sheet(isPresented: $addingPlace) {
                    CreatePlaceView { place in
                        add(place: place)
                    }
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

private extension ContentView {
    func add(place: FavoritePlace) {
        withAnimation {
            let newPlace = Place(context: viewContext)
            newPlace.id = UUID()
            newPlace.name = place.name
            newPlace.country = place.country
            newPlace.notes = place.notes
            newPlace.image = place.imageData
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
