//
//  ThoughtsViewController.swift
//  OwnMind
//
//  Created by Zidan Ramadhan on 27/04/22.
//

import UIKit
import AVFoundation

class ThoughtsViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var count: Mindfulness?
    
    var timer = Timer()
    var totalTime = 60
    var timePassed = 0
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var stepLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Thoughts"
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NotReallyWhite")!]
        navigationItem.standardAppearance = appearance
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func finishPressed(_ sender: UIButton) {
       // mindful.player?.stop()
        let plusCount = Mindfulness(context: self.context)
        plusCount.sessionsDone += 1
        
        //Save the data
        do {
            try self.context.save()
        } catch {
            print(error)
        }
        
    }
    
    @objc func updateTimer() {
        if timePassed < totalTime {
            timePassed += 1
            progressBar.progress = Float(timePassed) / Float(totalTime)
        } else {
            timer.invalidate()
            stepLabel.text = "You've completed your mindfulness session"
        }
    }
    
    
    
    
}
