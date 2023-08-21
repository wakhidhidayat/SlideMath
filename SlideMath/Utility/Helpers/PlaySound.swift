//
//  PlaySound.swift
//  SlideMath
//
//  Created by Wahid Hidayat on 19/04/23.
//

import AVFoundation

class AudioManager {
    var audioPlayer: AVAudioPlayer?
    
    static let shared = AudioManager()
    
    private init() {}
    
    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
                audioPlayer?.play()
            } catch {
                print("error")
            }
        }
    }
}
