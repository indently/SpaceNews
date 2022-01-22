//
//  NewsView.swift
//  SpaceNews
//
//  Created by Federico on 21/01/2022.
//

import SwiftUI

struct NewsView: View {
    @EnvironmentObject var data : NewsData
    private var textWidth = 300.0
    
    var body: some View {
        List {
            ForEach(data.news) { news in
                VStack(alignment: .leading) {
                    
                    Text("\(news.newsSite)")
                        .foregroundColor(.blue)
                        .italic()
                    
                    HStack(alignment: .center) {
                        AsyncImage(url: URL(string: news.imageUrl), transaction: Transaction(animation: .easeInOut)) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    .transition(.scale(scale: 0.1, anchor: .center))
                            } else {
                                ProgressView()
                            }
                        }
                    }
                    Text(news.title)
                        .font(.headline)
                        .padding(8)
                    
                    
                    Text(news.summary)
                        .font(.body)
                        .padding(8)
        
                }
            }
        }
        .refreshable {
            data.fetchSpaceData()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .environmentObject(NewsData())
    }
}
