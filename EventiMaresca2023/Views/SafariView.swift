//
//  SafariView.swift
//  EventiMaresca2023
//
//  Created by Edoardo Maresca on 03/10/23.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: String?
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return SFSafariViewController(url: URL (string: self.url ?? "")!)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    
    }
