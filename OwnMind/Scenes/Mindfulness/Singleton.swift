//
//  Singleton.swift
//  OwnMind
//
//  Created by Zidan Ramadhan on 29/04/22.
//

import AVFoundation

class Singleton {
    var player: AVAudioPlayer?
    static let sharedInstance = Singleton()
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "ClaireDeLune", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stopSound() {
        player?.stop()
    }
}
