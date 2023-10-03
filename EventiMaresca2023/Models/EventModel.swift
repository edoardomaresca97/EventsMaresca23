//
//  EventModel.swift
//  EventiMaresca2023
//
//  Created by iedstudent on 23/05/23.
//

import Foundation

struct EventModel : Identifiable, Codable {
    
    var id: Int?
    
    var name: String?
    var description: String?
    var categoryName: String?
    
    var date: String?      // ex. 2023-02-28 18:38:00
    var coverUrl: String?
    var price: Int?        // centesimi
    var address: String?
    
    var lat: Double?
    var lng: Double?
    
    var viewsCount: Int?
    var commentsCount: Int?
    var likesCount: Int?
    var attendeesCount: Int?
    
    var user: UserModel?
    
}

extension EventModel {
    
    ///
    var priceInEuro: String {
        
        if self.price == nil || self.price == 0 {
            return "Gratis"
        }
        
        var priceDouble = Double(self.price ?? 0)
        
        // Trasformo i centesimi in euro
        priceDouble = priceDouble / 100
        
        // Formatto il double sempre con due cifre dopo la virgola
        var priceFormatted = String(format: "%.2f €", priceDouble)
        
        // Sostituisco il punto con una virgola
        priceFormatted = priceFormatted.replacingOccurrences(of: ".", with: ",")
        
        return priceFormatted
    }
    
    
    var dayString: String {
        let formatter = DateFormatter()
        
        // "self.date" contiene una stringa tipo -> "2023-02-28 18:38:00"
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        // Converto la stringa della data in un oggetto Swift di tipo "Date"
        let date = formatter.date(from: self.date ?? "")
        
        // Decido qual è il formato di stringa che voglio come risultato
        formatter.dateFormat = "dd"
        
        // Converto l'oggetto "Date" di nuovo in una stringa
        return formatter.string(from: date ?? Date())
    }
    
    var monthString: String {
        let formatter = DateFormatter()
        
        // "self.date" contiene una stringa tipo -> "2023-02-28 18:38:00"
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        // Converto la stringa della data in un oggetto Swift di tipo "Date"
        let date = formatter.date(from: self.date ?? "")
        
        // Decido qual è il formato di stringa che voglio come risultato
        formatter.dateFormat = "MMM"
        
        // Converto l'oggetto "Date" di nuovo in una stringa
        return formatter.string(from: date ?? Date())
    }
    
    var yearString: String {
        let formatter = DateFormatter()
        
        // "self.date" contiene una stringa tipo -> "2023-02-28 18:38:00"
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        // Converto la stringa della data in un oggetto Swift di tipo "Date"
        let date = formatter.date(from: self.date ?? "")
        
        // Decido qual è il formato di stringa che voglio come risultato
        formatter.dateFormat = "yyyy"
        
        // Converto l'oggetto "Date" di nuovo in una stringa
        return formatter.string(from: date ?? Date())
    }
    
    var timeString: String {
        let formatter = DateFormatter()
        
        // "self.date" contiene una stringa tipo -> "2023-02-28 18:38:00"
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        // Converto la stringa della data in un oggetto Swift di tipo "Date"
        let date = formatter.date(from: self.date ?? "")
        
        // Decido qual è il formato di stringa che voglio come risultato
        formatter.dateFormat = "HH:mm"
        
        // Converto l'oggetto "Date" di nuovo in una stringa
        return formatter.string(from: date ?? Date())
    }
    
}
