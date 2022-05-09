//
//  BreathViewController.swift
//  OwnMind
//
//  Created by Zidan Ramadhan on 27/04/22.
//

import UIKit

class BreathViewController: UIViewController {
    
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var timer = Timer()
    var totalTime = 60
    var timePassed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        title = "Deep Breath"
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NotReallyWhite")!]
        navigationItem.standardAppearance = appearance
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if timePassed < totalTime {
            timePassed += 1
            progressBar.progress = Float(timePassed) / Float(totalTime)
        } else {
            timer.invalidate()
            stepLabel.text = "FINISHED"
        }
    }
}

