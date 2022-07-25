//
//  AudioPlayer.swift
//  Restart
//
//  Created by Mohamed El-Alafty on 25/07/2022.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(name: String, type: String){
    if let path = Bundle.main.path(forResource: name, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch{
            print("cannot find file")
        }
    }
}
