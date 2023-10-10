//
//  Session.swift
//  EventiMaresca2023
//
//  Created by iedstudent on 23/05/23.
//

import SwiftUI
import DBNetworking

class Session : ObservableObject {
    
    static var shared = Session()
    
    @Published var loggedUser: UserModel?
    
    @Published var isLogged: Bool?
    private let databaseKey = "LoggedUser"
    
    func save(userToSave: UserModel?) {
        self.loggedUser = userToSave
        
        if userToSave != nil {
            isLogged = true
            // Coverto L'oggetto "UserModel" in un insieme di byte "Data"
            let data = try? JSONEncoder().encode(userToSave)
            
            UserDefaults.standard.set(data, forKey: databaseKey)
        } else {
            isLogged = false
            UserDefaults.standard.removeObject( forKey: databaseKey)
        }
        // salvo l'utente sul database dell'app, così al riavvio non c'è bisogno del login
        
    }
    
    
    func load() {
        // Carico i dati dal database
        let data = UserDefaults.standard.data(forKey: databaseKey)
        
        // Provoa convertire i dati in un oggetto "UserModel"
        self.loggedUser =  try? JSONDecoder().decode(UserModel.self, from: data ?? Data())
        
        //self.isLogged = self.loggedUser == nil ? false : true
        
        if self.loggedUser == nil {
            self.isLogged = false
            
        }
        else {
            self.isLogged = true
        }
       
        
    }
    
}
    

