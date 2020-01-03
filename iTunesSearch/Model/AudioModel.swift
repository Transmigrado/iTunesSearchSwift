//
//  AudioModel.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 03-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import Foundation
import SwiftAudio
import Combine

class AudioModel : ObservableObject {
     
    @Published var progress = 0.0
    
    var audioPlayer = AudioPlayer()
    var audioUrl = "" {
        didSet{
             debugPrint(audioUrl)
            let audioItem = DefaultAudioItem(audioUrl: audioUrl, sourceType: .stream)
            do{
                _ = try audioPlayer.load(item: audioItem, playWhenReady: true)
            } catch let error {
                debugPrint(error)
            }
        }
    }
    

    init() {
     
      
        audioPlayer.event.secondElapse.addListener(self) { event in
            self.progress = Double(event)
        }
     
        
    }
    
    
}
