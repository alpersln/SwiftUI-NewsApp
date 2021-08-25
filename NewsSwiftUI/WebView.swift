//
//  WebView.swift
//  NewsSwiftUI
//
//  Created by calatinalper on 25.08.2021.
//

import Foundation
import WebKit
import SwiftUI


struct WebView: UIViewRepresentable {
    
    
    
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        if let urlString = urlString {
            if let url = URL(string: urlString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
