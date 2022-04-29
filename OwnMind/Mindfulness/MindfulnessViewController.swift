//
//  MindfulnessViewController.swift
//  OwnMind
//
//  Created by Zidan Ramadhan on 27/04/22.
//

import UIKit

class MindfulnessViewController: UIViewController {
    
    @IBOutlet weak var sessionsDoneView: UIView!
    @IBOutlet weak var sessionsCountLabel: UILabel!
    
    let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView(view: sessionsDoneView)
        
        //Set navigation appearance
        title = "Mindfulness"
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NotReallyBlack")!]
        navigationItem.standardAppearance = appearance
        
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToDeepBreath", sender: self)
        Singleton.sharedInstance.playSound()
    }
    
    
    //MARK: - View Modifier
    func setView(view: UIView){
        // corner radius
        view.layer.cornerRadius = 18

        // border
        view.layer.borderWidth = 0.0
        view.layer.borderColor = UIColor.black.cgColor

        // shadow
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 6.0
    }

}
