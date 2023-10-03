//
//  LoginView.swift
//  EventiMaresca2023
//
//  Created by iedstudent on 06/06/23.
//

import SwiftUI
import DBNetworking

struct LoginView: View {
    
    @State private var email = "davide@email.it"
    
    @State private var password = "password"
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Bentornato!")
                .font(.title)
                .bold()
                .navigationTitle("Login")
            
            Text("Inserisci i tuoi dati per continuare:")
            
            Text("Premi Shift+2 sulla Preview per la @")
                .italic()
                .foregroundColor(.gray)
            
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray, lineWidth: 1)
                }
            
            SecureField("Password", text: $password)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray, lineWidth: 1)
                }
            
            HStack(spacing: 0) {
                Text("Hai dimenticato la password? ")
                
                Button {
                    // Codice da eseguire
                } label: {
                    Text("Recuperala")
                        .bold()
                        .foregroundColor(.blue)
                }
            }
            
            Spacer()
                .frame(maxWidth: .infinity)
                .overlay {
                    Text("ツ")
                        .font(.system(size: 100))
                        .opacity(0.1)
                }
            
            VStack {
                HStack(spacing: 0) {
                    Text("Proseguendo accetti ")
                    
                    Button {
                        // Codice da eseguire
                    } label: {
                        Text("Termini e condizioni")
                            .bold()
                            .foregroundColor(.blue)
                    }
                }
                
                Button {
                    Task {
                        // Chiamo la funzione per fare la login
                        await login()
                    }
                } label: {
                    Text("Accedi")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(16)
                }
            }
        }
        .padding()
    }
    
    /// Funzione da utilizzare per chiamare l'API di login
    @MainActor private func login() async {
        // 1. Preparo la richiesta da inviare al server
        let request = DBNetworking.request(
            url: "https://edu.davidebalistreri.it/app/v2/login",
            type: .post,
            parameters: [
                "email": self.email,
                "password": self.password,
            ]
        )
        
        // 2. Invio la richiesta e attendo la risposta
        let response = await request.response(type: UserResponseModel.self)
        
        // 3. Controllo se c'è stato un errore
        if let error = response.body?.error {
            print("Errore: " + (error.description ?? ""))
            return
        }
        
        // 4. Tutto ok, salvo l'utente appena loggato
        let user = response.body?.data
        print("FirstName: " + (user?.firstName ?? ""))
        
        withAnimation {
            Session.shared.save(userToSave: user)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
                .navigationTitle("Login")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
