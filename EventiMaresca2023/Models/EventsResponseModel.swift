//
//  EventsResponseModel.swift
//  EventiMaresca2023
//
//  Created by iedstudent on 23/05/23.
//

import Foundation

struct EventsResponseModel : Codable {
    
    var error: ErrorModel?
    
    var data: [EventModel]?
    
}
