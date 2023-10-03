//
//  ProfileView.swift
//  EventiMaresca2023
//
//  Created by iedstudent on 13/06/23.
//

import SwiftUI

struct ProfileView: View {
    
    // Arrivati su questa pagina, assumo che ci sia un utente connesso
    @State var userToShow = Session.shared.loggedUser
    
    var body: some View {
        NavigationView {
            VStack {
                Text(userToShow?.firstName ?? "Nome utente")
                    .font(.largeTitle)
                
                NetworkImageView(url: userToShow?.avatarUrl)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                
                Spacer()
                    .navigationTitle("Profilo")
                    .navigationBarTitleDisplayMode(.inline)
                
                Button {
                    withAnimation {
                        // Logout
                        Session.shared.save(userToSave: nil)
                    }
                } label: {
                    Text("Logout")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("BackgroundColor"))
                        .cornerRadius(16)
                }
            }
            .padding()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
