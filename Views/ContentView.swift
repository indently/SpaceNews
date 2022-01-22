//
//  ContentView.swift
//  SpaceNews
//
//  Created by Federico on 21/01/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = NewsData()
    
    var body: some View {
        VStack {
            NewsView()
        }
        .environmentObject(data)
        .onAppear {
            data.fetchSpaceData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
