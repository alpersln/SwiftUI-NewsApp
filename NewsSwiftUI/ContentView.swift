//
//  ContentView.swift
//  NewsSwiftUI
//
//  Created by calatinalper on 24.08.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var network = Network()
 
    
    var body: some View {
        NavigationView {
        List(network.articles) {
            article in
            
            Item(description: article.description, source: article.source.name, title: article.title)
            
            if article.urlToImage != "" {
                WebImage(url: URL(string: article.urlToImage)!,
                         options: .highPriority,
                         context: nil).resizable().frame(width: 130, height: 130).cornerRadius(20)
            }
        }.navigationBarTitle("Haberler")
    }
            .onAppear {
                    self.network.getNews()
                    }
            
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Item: View {
  var description: String?
  var source: String
  var title: String
 // var urlToImage: String
  
  
    init(description: String?, source: String, title: String) {
    
    
    self.description = description ?? ""
    self.source = source
    self.title = title
//    self.urlToImage = urlToImage
  }
  

  
  var body: some View {
    
    VStack(alignment: .leading,spacing: 0) {
        

      Text(title)
        .bold()
        .font(.system(size: 20))
      Text(source)
        .font(.footnote)
        .foregroundColor(.secondary)
        .padding(.vertical)
      Text(description ?? "")
        .font(.system(size: 16))
        .padding(.bottom)
        .lineLimit(2)
    }
  }
}
