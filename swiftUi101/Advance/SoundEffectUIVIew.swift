//
//  SoundEffectUIVIew.swift
//  swiftUi101
//
//  Created by Puthsitha Moeurn on 26/8/25.
//

import SwiftUI
import AVKit

enum SoundOption:String{
    case punch
    case shocked
    case wow
}

class SoundManger {
    static let instance = SoundManger()
    var player:AVAudioPlayer?
    
    func playSound(sound: SoundOption){
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do{
            try player = AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch let error {
            print("Error play sound : \(error)")
        }
    }
}

struct SoundEffectUIVIew: View {
    var body: some View {
        VStack(spacing: 20){
            Text("Play meme sound effect!")
                .font(.largeTitle)
                .padding(.bottom)
            
            Button("PUNCH") {
                SoundManger.instance.playSound(sound: .punch)
            }
            .padding(.bottom)
            
            Button("SHOCKED") {
                SoundManger.instance.playSound(sound: .shocked)
            }
            .padding(.bottom)
            
            Button("WOW") {
                SoundManger.instance.playSound(sound: .wow)
            }
            .padding(.bottom)
            
        }
    }
}

#Preview {
    SoundEffectUIVIew()
}
