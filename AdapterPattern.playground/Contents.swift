//: Playground - noun: a place where people can play

import UIKit

protocol MediaPlayer {
    func play(audioType: String, fileName: String)
}

protocol AdvancedMediaPlayer {
    func playVlc(filename: String)
    func playMp4(filename: String)
}

class AudioPlayer: MediaPlayer {
    var mediaAdapter : MediaPlayer?
    
    func play(audioType: String, fileName: String) {
        switch audioType {
        case "mp3":
            print("plays \(audioType) file: \(fileName)")
        case "mp4":
            mediaAdapter = MediaAdapter(mediaType: "mp4")
            mediaAdapter?.play(audioType, fileName: fileName)
        case "vlc":
            mediaAdapter = MediaAdapter(mediaType: "vlc")
            mediaAdapter?.play(audioType, fileName: fileName)
        default:
            print("Doesn't play")
        }
    }
}

class VlcPlayer: AdvancedMediaPlayer {
    
    func playVlc(filename: String) {
        print("Playing vlc. Filename: \(filename)")
    }
    
    func playMp4(filename: String) {
        print("Doesn't play")
    }
}

class Mp4Player: AdvancedMediaPlayer {
    
    func playVlc(filename: String) {
        print("Doesn't play")
    }
    
    func playMp4(filename: String) {
        print("Playing mp4. Filename: \(filename)")
    }
}

class MediaAdapter: MediaPlayer {
    let advancedPlayer : AdvancedMediaPlayer?
    
    init(mediaType : String) {
        switch mediaType {
        case "vlc":
            advancedPlayer = VlcPlayer()
        case "mp4":
            advancedPlayer = Mp4Player()
        default:
            advancedPlayer = nil
        }
    }
    
    func play(audioType: String, fileName: String) {
        switch audioType {
        case "vlc":
            advancedPlayer!.playVlc(fileName)
        case "mp4":
            advancedPlayer!.playMp4(fileName)
        default:
            break
        }
    }
}

let audioPlayer = AudioPlayer()
audioPlayer.play("mp3", fileName: "hello.mp3")
audioPlayer.play("mp4", fileName: "hero.mp4")
audioPlayer.play("vlc", fileName: "night.vlc")
