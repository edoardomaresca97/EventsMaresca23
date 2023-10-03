//
//  NetworkImageView.swift
//  EventiMaresca2023
//
//  Created by iedstudent on 23/05/23.
//

import SwiftUI

struct NetworkImageView: View {
    
    var url: String?
    
    var body: some View {
        // Immagine scaricata da internet
        AsyncImage(
            url: URL(string: url ?? ""),
            content: { image in
                // Qui regoliamo la modalità di visualizzazione
                // dell'immagine scaricata
                VStack {}
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay {
                        image.resizable().scaledToFill()
                    }
            },
            placeholder: {
                // Durante il download dell'immagine, mostro la progress view
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            }
        )
    }
}

struct NetworkImageView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkImageView()
    }
}
