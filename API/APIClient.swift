//
//  APIClient.swift
//  SpaceNews
//
//  Created by Federico on 21/01/2022.
//
// API ENDPOINT = https://api.spaceflightnewsapi.net/v3/articles

import Foundation

struct SpaceData : Codable, Identifiable {
    var id: Int
    var title: String
    var url: String
    var imageUrl: String
    var newsSite: String
    var summary: String
    var publishedAt: String
}

@MainActor class SpaceAPI: ObservableObject {
    @Published var news: [SpaceData] = []
    
    func getData() {
        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let spaceData = try! JSONDecoder().decode([SpaceData].self, from: data)
            
            DispatchQueue.main.async {
                print("Loaded new data successfully! Articles: \(spaceData.count)")
                self.news = spaceData
            }
        }.resume()
    }
}



