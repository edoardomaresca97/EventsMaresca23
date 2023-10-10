//
//  Session.swift
//  EventiMaresca2023
//
//  Created by iedstudent on 13/06/23.
//

import Foundation

/// Questa classe contiene l'utente connesso sull'app
class Session : ObservableObject {
    
    /// Utilizzo il pattern Singleton per avere in app una sola istanza della Sessione
    static var shared = Session()
    
    
    @Published var loggedUser: UserModel?
    
    /// Questa variabile indica se c'è un utente connesso.
    /// true: c'è un utente connesso
    /// false: non c'è un utente connesso
    /// nil: ancora non è stato controllato se c'è un utente oppure no
    @Published var isLogged: Bool?
    
    
    /// Da utilizzare per salvare un utente in sessione,
    /// oppure eliminarlo dalla sessione (passando nil).
        func save(userToSave: UserModel?) {
        
        loggedUser = userToSave
        
        if userToSave != nil {
            isLogged = true
        } else {
            isLogged = false
        }
    }
    
    /// Da utilizzare per caricare l'utente salvato sul database dell'app.
    func load() {
        // TODO: prossima volta salviamo l'utente sul database
        isLogged = false
    }
}


