//
//  EventDetailView.swift
//  EventiMaresca2023
//
//  Created by iedstudent on 30/05/23.
//

import SwiftUI
import MapKit

struct EventDetailView: View {
    
    /// Questo è l'evento da rappresentare su questa pagina,
    /// viene passato dalla pagina precedente (EventsView)
    var eventToShow: EventModel
    
    // L'area geografica da visualizzare sulla mappa
    @State var region = MKCoordinateRegion()
    
    
    var body: some View {
        ScrollView {
            VStack {
                
                // MARK: - Copertina
                
                ZStack(alignment: .bottom) {
                    NetworkImageView(url: eventToShow.coverUrl)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: .infinity, height: 150)
                        .background(
                            LinearGradient(
                                colors: [.white, .clear],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                }
                .ignoresSafeArea()
                // Per ignorare la safe area solo "sopra"
                .mask(Rectangle().edgesIgnoringSafeArea(.top))
                .frame(height: 300)
                .clipped()
                .overlay(alignment: .bottomTrailing) {
                    
                    Button {
                        // TODO: Codice per acquistare un biglietto
                        // Mostrare alert e riprodurre un suono
                        
                    } label: {
                        HStack(spacing: 4) {
                            Text(eventToShow.priceInEuro)
                                .bold()
                            
                            Image(systemName: "cart.fill")
                        }
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(.blue)
                        .cornerRadius(12)
                        .padding()
                    }
                }
                
                
                // MARK: - Info dell'evento
                
                VStack(alignment: .leading, spacing: 12) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(eventToShow.categoryName?.uppercased() ?? "")
                            .foregroundColor(.gray)
                            .padding(.top, 2)
                        
                        // I due punti interrogativi servono a dare un valore di backup
                        // nel caso in cui non esistesse il nome dell'evento
                        Text(eventToShow.name ?? "")
                            .font(.title2)
                            .bold()
                    }
                    
                    
                    // MARK: - Likes views ecc
                    
                    HStack(spacing: 12) {
                        HStack(spacing: 4) {
                            Image(systemName: "eye.fill")
                            
                            Text("\(eventToShow.viewsCount ?? 0)")
                        }
                        
                        HStack(spacing: 4) {
                            Image(systemName: "hand.thumbsup.fill")
                            Text("\(eventToShow.likesCount ?? 0)")
                        }
                        
                        HStack(spacing: 4) {
                            Image(systemName: "text.bubble.fill")
                            Text("\(eventToShow.commentsCount ?? 0)")
                        }
                        
                        HStack(spacing: 4) {
                            Image(systemName: "person.3.fill")
                            Text("\(eventToShow.attendeesCount ?? 0)")
                        }
                    }
                    .foregroundColor(.gray)
                    
                    
                    // MARK: - Descrizione
                    
                    Text(eventToShow.description ?? "")
                        .fixedSize(horizontal: false, vertical: true)
                    
                    
                    // MARK: - Data
                    
                    HStack(spacing: 0) {
                        VStack(spacing: 0) {
                            Text(eventToShow.dayString)
                                .font(.title2)
                                .bold()
                            
                            Text(eventToShow.monthString.uppercased())
                            
                            Text(eventToShow.yearString)
                                .font(.caption)
                        }
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(.red)
                        .cornerRadius(12)
                        .padding(.trailing, 12)
                        
                        VStack(alignment: .leading) {
                            Text(eventToShow.address ?? "")
                                .font(.title2)
                            
                            Text(eventToShow.timeString)
                        }
                        
                        Spacer()
                    }
                    
                    
                    // MARK: Mappa
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Indirizzo:")
                            .font(.title2.bold())
                            .padding(.bottom, 4)
                        
                        Text(eventToShow.address ?? "")
                            .padding(.bottom)
                        
                        Map(
                            coordinateRegion: $region,
                            // Disabilito le interazioni con la mappa
                            interactionModes: []
                        )
                        .frame(height: 200)
                        .cornerRadius(8)
                        // Aggiungo la TapGesture per non andare in conflitto con
                        // le gesture di default della mappa (zoom, pan, tap, ecc)
                        .simultaneousGesture (
                            TapGesture()
                                .onEnded {
                                    // Codice che viene eseguito quando l'utente
                                    // ha toccato la mappa e sollevato il dito
                                    
                                    // TODO: Avvio la navigazione con le mappe di iOS
                                    // LocationHelper.navigateTo(
                                    //     destinationCoordinate: giocatoreDaRappresentare.coordinate,
                                    //     destinationName: giocatoreDaRappresentare.indirizzo
                                    // )
                                }
                        )
                    }
                    
                    
                    // MARK: - Creatore
                    
                    HStack {
                        NetworkImageView(url: eventToShow.user?.avatarUrl)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("Evento organizzato da:")
                            
                            Text(eventToShow.user?.firstName ?? "")
                                .bold()
                        }
                    }
                    
                    
                    // Riempio lo spazio fino in fondo
                    Spacer()
                        .navigationTitle(eventToShow.name ?? "")
                }
                .padding(.horizontal, 12)
            }
        }
        .onAppear {
            // Aggiorno il centro geografico visualizzato sulla mappa
            region.center = CLLocationCoordinate2D(
                latitude: eventToShow.lat ?? 0,
                longitude: eventToShow.lng ?? 0
            )
            
            // Modifico lo zoom della mappa
            region.span = MKCoordinateSpan(
                latitudeDelta: 0.002,
                longitudeDelta: 0.002
            )
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Per fixare il problema della mappa che non si aggiorna
        NavigationView {
            EventDetailView(
                // Creo un evento solo per far funzionare la preview
                eventToShow: EventModel(
                    name: "Evento di prova zzz",
                    description: "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet",
                    categoryName: "Categoria 1",
                    date: "2023-02-28 18:38:00",
                    coverUrl: "https://edu.davidebalistreri.it/app/v2/images/covers/cover_events_51_1686666119.jpg",
                    address: "Via Alcamo 11",
                    lat: 41.886394,
                    lng: 12.523890,
                    viewsCount: 999,
                    commentsCount: 999,
                    likesCount: 999,
                    attendeesCount: 999,
                    user: UserModel(
                        firstName: "Davide",
                        lastName: "Prova",
                        avatarUrl: "https://edu.davidebalistreri.it/app/v2/images/covers/cover_events_56_1686666455.jpg"
                    )
                )
            )
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
