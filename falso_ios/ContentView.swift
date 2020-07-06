//
//  ContentView.swift
//  falso_ios
//
//  Created by Alperen Duran on 6.06.2020.
//  Copyright © 2020 Alperen Duran. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            BlogList().tabItem {
                Image(systemName: "book")
                Text("Blog")
            }
            
            PodcastList().tabItem {
                Image(systemName: "music.note.list")
                Text("Podcastler")
            }
            
            TodayList().tabItem {
                Image(systemName: "calendar")
                Text("Bugün")
            }
        }.accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
