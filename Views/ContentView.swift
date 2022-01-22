//
//  ContentView.swift
//  SpaceNews
//
//  Created by Federico on 21/01/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = SpaceAPI()
    
    var body: some View {
        VStack {
            NewsView()
        }
        .environmentObject(data)
        .onAppear {
            data.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
