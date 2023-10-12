//
//  ViewController.swift
//  watchstop
//
//  Created by Imcrinox Mac on 08/12/1444 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var playPauseBtn: UIButton!
    var counter: Float = 0.0 {
        didSet{
            timerLabel.text = String(format: "%.1f", counter)
        }
    }
//    var isSelected = true
    var timer : Timer? = Timer()
    var isPlaying = false
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counter = 0.0
    }


    @IBAction func resetButton(_ sender: Any) {
        if let timerTemp = timer {
            timerTemp.invalidate()
        }
        
        timer = nil
        isPlaying = false
        counter = 0
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    
    @IBAction func playButtn(_ sender: Any) {
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        playBtn.isEnabled = true
        playBtn.isEnabled = false
        if let timerTemp = timer{
            timerTemp.invalidate()
        }
        timer = nil
        isPlaying = false
    }
    
    @objc func UpdateTimer() {
        counter = counter + 0.1
    }
    
    @IBAction func playpause(_ sender: UIButton) {
        playPauseBtn.setImage(UIImage(systemName: "play.fill"), for: .normal)
        if (!sender.isSelected) {
            playPauseBtn.setImage(UIImage(systemName: "pause.fill"), for: .normal)

            timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.UpdateTimer), userInfo: nil, repeats: true)
        }
        else {
            playPauseBtn.setImage(UIImage(systemName: "play.fill"), for: .normal)

            if let timerTemp = timer {
                timerTemp.invalidate()
            }
        }
        sender.isSelected = !sender.isSelected

    }
    
}

