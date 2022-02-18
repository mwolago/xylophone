//
//  MainViewController.swift
//  Xylophone
//
//  Created by Erni Iun on 2022/02/16.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    //MARK: -Outlets
    @IBOutlet var keyButtons: [UIButton]?
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        keyButtons?.forEach{ $0.layer.cornerRadius = 15 }
    }

    //MARK: - Actions
    @IBAction func keyPressed(_ sender: UIButton) {
        guard let currentTitle = sender.currentTitle else { return }
        playSound(soundName: currentTitle)
    }
    
    func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }

        if let player = try? AVAudioPlayer(contentsOf: url) {
            player.play()
        } else {
            return
        }
    }
}
