//
//  SplashView.swift
//  EventiMaresca2023
//
//  Created by iedstudent on 06/06/23.
//

import SwiftUI

struct SplashView: View {
    
    // Questa variabile fa partire l'animazione
    @State var isAnimating = false
    
    // La sessione va salvata fuori dal body,
    // così SwiftUI riesce ad aggiornare la view automaticamente
    @StateObject var session = Session.shared
    
    
    var body: some View {
        if session.isLogged == true {
            // C'è un utente connesso
            HomeView()
        }
        else if session.isLogged == false {
            // Non c'è un utente connesso
            WelcomeView()
        }
        else {
            // Eseguo l'animazione di benvenuto
            ZStack {
                Text("Bella")
                    .opacity(isAnimating ? 1 : 0)
                    .scaleEffect(isAnimating ? 10 : 1)
                    .animation(.spring(response: 2, dampingFraction: 0.4), value: isAnimating)
            }
            .onAppear {
                Task {
                    // Faccio partire l'animazione appena compare la pagina
                    isAnimating = true
                    
                    // Pausa di 2 secondi
                    try? await Task.sleep(nanoseconds: 2_000_000_000)
                    
                    // Faccio partire l'app
                    withAnimation {
                        // Carico la sessione: se c'era un utente connesso
                        // l'app andrà automaticamente sulla pagina principale,
                        // oppure caricherà la pagina di benvenuto
                        session.load()
                    }
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SplashView()
        }
    }
}
