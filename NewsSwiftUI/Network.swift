//
//  Network.swift
//  NewsSwiftUI
//
//  Created by calatinalper on 24.08.2021.
//

import Foundation

struct NewsModal: Codable {
    
    let articles: [Article]
}

struct Article: Codable,Identifiable {
    
    var id: String {
        return url
    }
    
    var sourceName: String {
        return source.name
    }
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String
    //let publishedAt: Date
    let content: String?
    let source: Source
    
    }

    struct Source: Codable {
        let name: String

 }


class Network: ObservableObject {
    @Published var articles = [Article]()
    func getNews() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey=1f643f179cef4b14aab65b5889a7214b") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(NewsModal.self, from: data)
                    print(result)
                    DispatchQueue.main.async {
                        self.articles = result.articles
                    }
                } catch  {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
