//
//  EventsView.swift
//  EventiMaresca2023
//
//  Created by iedstudent on 23/05/23.
//

import SwiftUI
import DBNetworking
import MapKit

struct EventsView: View {
    
    /// La lista degli eventi da rappresentare su questa pagina.
    @State private var eventsToShow: [EventModel] = []
    
    /// Determina se visualizzare la lista o la mappa degli eventi.
    @State private var isList: Bool = true
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 42, longitude: 12),
    span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
   
    
    var body: some View {
        // Disegno una riga per ogni evento che sta
        // nella lista di eventi da rappresentare
        NavigationView {
            List(eventsToShow) { event in
                
                // Per togliere la freccia messa automaticamente da SwiftUI
                ZStack {
                    // Navigation link invisibile
                    NavigationLink(
                        destination: EventDetailView(eventToShow: event)
                    ) { /* vuoto */ }.opacity(0)
                    
                    // UI dell'elemento
                    VStack(alignment: .leading) {
                        NetworkImageView(url: event.coverUrl)
                            .frame(height: 200)
                            .cornerRadius(16)
                            .overlay(alignment: .topTrailing) {
                                VStack(spacing: 0) {
                                    Text(event.dayString)
                                        .font(.title2)
                                        .bold()
                                    
                                    Text(event.monthString.uppercased())
                                    
                                    Text(event.yearString)
                                        .font(.caption)
                                }
                                .foregroundColor(.white)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 12)
                                .background(.red)
                                .cornerRadius(12)
                                .padding(12)
                            }
                        
                        VStack(alignment: .leading) {
                            Text(event.name ?? "")
                                .font(.title2)
                            
                            HStack {
                                Image(systemName: "tag.fill")
                                
                                Text(event.priceInEuro)
                                    .font(.title3)
                            }
                        }
                    }
                    .padding(.bottom, 4)
                }
                
                // Tolgo il separatore tra gli elementi
                .listRowSeparator(.hidden)
                
            }
            // Tolgo il padding intorno alla lista
            .listStyle(.plain)
            // Titolo della pagina
            .navigationTitle("Eventi")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                // Chiedo al server la lista di eventi aggiornata
                let request = DBNetworking.request(
                    url: "https://edu.davidebalistreri.it/app/v2/events"
                )
                
                Task {
                    let response = await request.response(type: EventsResponseModel.self)
                    self.eventsToShow = response.body?.data ?? []
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //coidce da eseguire
                        self.isList.toggle()
                    } label: {
                        Image(systemName: isList ? "map" : "calendar")
                    }
                }
            }
        }
    }
    
    struct EventsView_Previews: PreviewProvider {
        static var previews: some View {
            EventsView()
        }
    }
}
