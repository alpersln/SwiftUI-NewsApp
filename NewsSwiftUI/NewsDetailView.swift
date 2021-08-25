//
//  NewsDetailView.swift
//  NewsSwiftUI
//
//  Created by calatinalper on 25.08.2021.
//

import SwiftUI

struct NewsDetailView: View {
    
    let urlString: String
    
    var body: some View{
        WebView(urlString: urlString)
    }
   
}
