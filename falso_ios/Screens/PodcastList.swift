//
//  PodcastList.swift
//  falso_ios
//
//  Created by Alperen Duran on 6.06.2020.
//  Copyright © 2020 Alperen Duran. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI
import AVFoundation

struct PodcastList: View {
    @ObservedObject var podcastStore = PodcastStore()
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top) {
                        ForEach(self.podcastStore.podcasts) { podcast in
                            PodcastView(podcast: podcast)
                                .frame(width: 250)
                                .padding(.horizontal)
                        }
                    }.padding(.horizontal)
                }.alert(isPresented: $podcastStore.showError) {
                    Alert(
                        title: Text("Error"),
                        message: Text(podcastStore.errorMessage)
                    )
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
                .onTapGesture {
                    let task = URLSession.shared.downloadTask(with: self.podcast.podcastURL) { (data, resp, err) in
                        
                    
                    do {
                        let audioPlayer = try AVAudioPlayer(contentsOf: data!)
                        try AVAudioSession.sharedInstance().setCategory(
                            AVAudioSession.Category.playback,
                            mode: AVAudioSession.Mode.default,
                            options: [AVAudioSession.CategoryOptions.mixWithOthers]
                        )
                        audioPlayer.prepareToPlay()
                        audioPlayer.play()
                    
                    } catch {
                        print(error)
                    }
                    }
                    task.resume()
                }
            
            Text(podcast.title)
                .font(.headline)
            
            Text(podcast.contentSnippet)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
