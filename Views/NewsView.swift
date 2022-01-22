//
//  NewsView.swift
//  SpaceNews
//
//  Created by Federico on 21/01/2022.
//

import SwiftUI

struct NewsView: View {
    @EnvironmentObject var data : SpaceAPI
    private var textWidth = 300.0
    
    var body: some View {
        List {
            ForEach(data.news) { news in
                NewsArticle(
                    title: news.title,
                    imageURL: news.imageUrl, siteName: news.newsSite, summary: news.summary)
            }
        }
        .refreshable {
            data.getData()
        }
    }
    
    struct NewsView_Previews: PreviewProvider {
        static var previews: some View {
            NewsView()
                .environmentObject(SpaceAPI())
        }
    }
}
