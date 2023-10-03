//
//  HomeView.swift
//  EventiMaresca2023
//
//  Created by iedstudent on 13/06/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            EventsView()
                .tabItem {
                    Label("Eventi", systemImage: "calendar")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profilo", systemImage: "person.fill")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
