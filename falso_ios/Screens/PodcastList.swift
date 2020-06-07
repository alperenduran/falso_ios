//
//  PodcastList.swift
//  falso_ios
//
//  Created by Alperen Duran on 6.06.2020.
//  Copyright © 2020 Alperen Duran. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct PodcastList: View {
    @ObservedObject var podcastStore = PodcastStore()
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top) {
                        ForEach(self.podcastStore.podcast) { podcast in
                            PodcastView(podcast: podcast)
                                .frame(width: 250)
                                .padding(.horizontal)
                        }
                    }.padding(.horizontal)
                }
                    
                Spacer()
            }.navigationBarTitle("Podcast")
        }
    }
}

struct PodcastList_Previews: PreviewProvider {
    static var previews: some View {
        PodcastList()
    }
}

struct PodcastView: View {
    let podcast: Podcast
    var body: some View {
        VStack(alignment: .leading) {
            
            KFImage(podcast.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250.0, height: 250.0)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            
            Text(podcast.title)
                .font(.headline)
            
            Text(podcast.contentSnippet)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
