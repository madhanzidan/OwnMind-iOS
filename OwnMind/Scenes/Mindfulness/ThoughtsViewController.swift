//
//  ThoughtsViewController.swift
//  OwnMind
//
//  Created by Zidan Ramadhan on 27/04/22.
//

import UIKit

class ThoughtsViewController: UIViewController {
    
    var timer = Timer()
    var totalTime = 60
    var timePassed = 0
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var stepLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        title = "Thoughts"
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NotReallyWhite")!]
        navigationItem.standardAppearance = appearance
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        //Set default value for counter session count
        defaults.set(0, forKey: "counterSession")
        
    }
    
    @IBAction func finishPressed(_ sender: UIButton) {
        //Singleton to stop sound
        Singleton.sharedInstance.stopSound()
        
        //Pop to root navigation controller
        if self.presentingViewController != nil {
            self.dismiss(animated: false, completion: {
                self.navigationController!.popToRootViewController(animated: true)
            })
        } else {
            self.navigationController!.popToRootViewController(animated: true)
        }
        
        //Increment countLabel
        UserDefaults.incrementCounter(key: "counter")
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

//MARK: - UserDefaults for Counter
extension UserDefaults {
    class func incrementCounter(key: String) {
        let defaults = UserDefaults.standard
        let val = defaults.integer(forKey: key)
        defaults.set(val + 1, forKey: key)
        defaults.synchronize()
    }
}
