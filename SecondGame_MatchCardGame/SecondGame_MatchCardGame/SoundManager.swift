//
//  SoundManager.swift
//  SecondGame_MatchCardGame
//
//  Created by Pratik Joshi on 5/28/20.
//  Copyright © 2020 Pratik Joshi. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager{
    
    static var audioPlayer:AVAudioPlayer?
    
    enum SoundEffect{
        
        case flip
        case shuffle
        case match
        case nomatch
        
    }
    
    static func playSound(_ effect:SoundEffect){
        
        var soundFilename = ""
        
        // Determine which sound effect we want to play
        // And set the appropriate filename
        switch effect {
            
        case .flip:
            soundFilename = "cardflip"
            
        case .shuffle:
            soundFilename = "shuffle"
            
        case .match:
            soundFilename = "dingcorrect"
            
        case .nomatch:
            soundFilename = "dingwrong"
            
        }
        
        // Get the path to the sound file inside the bundle.
        let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: "wav")
        
        guard bundlePath != nil else {
            print("Couldn't find sound file \(soundFilename) in the bundle")
            return
        }
        
        // Create an URL object from the string path.
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do{
            // Create audio player object.
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            // Play the sound
            audioPlayer?.play()
            
        }
        catch{
            
            // Couldn't create the audio player object, log the error
            print("Couldn't create the audio player object for a sound file \(soundFilename)")
            
        }
    }
    
}
