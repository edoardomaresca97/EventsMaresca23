//
//  UserModel.swift
//  EventiMaresca2023
//
//  Created by iedstudent on 23/05/23.
//

import Foundation

struct UserModel : Codable {
    
    var id: Int?
    
    var email: String?
    var firstName: String?
    var lastName: String?

    var avatarUrl: String?
    
}
