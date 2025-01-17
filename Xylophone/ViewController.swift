//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        let seconds = 0.2
        
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            sender.alpha = 1
        }
        
        playSound(resourceName: sender.currentTitle!)
    }
    
    func playSound(resourceName: String) {
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: "wav") else {return}
        do {
            player = try! AVAudioPlayer(contentsOf: url)
            player?.play()
        }
        
    }
}

