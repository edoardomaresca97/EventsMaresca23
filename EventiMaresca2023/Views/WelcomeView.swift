//
//  WelcomeView.swift
//  EventiMaresca2023
//
//  Created by iedstudent on 06/06/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Text("Benvenuto!")
                    .font(.title)
                    .navigationBarTitleDisplayMode(.inline)
                
                NavigationLink(destination: LoginView()) {
                    Text("Fai il login")
                        .font(.title2).bold()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 24)
                        .background(.blue)
                        .cornerRadius(12)
                }
                
                NavigationLink(destination: SignupView()) {
                    Text("Registrati")
                        .font(.title2).bold()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 24)
                        .background(.blue)
                        .cornerRadius(12)
                }
            }
            .padding()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
