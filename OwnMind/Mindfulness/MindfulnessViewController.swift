//
//  MindfulnessViewController.swift
//  OwnMind
//
//  Created by Zidan Ramadhan on 27/04/22.
//

import UIKit
import AVFoundation

class MindfulnessViewController: UIViewController {

    
    @IBOutlet weak var sessionsDoneView: UIView!
    @IBOutlet weak var sessionsCountLabel: UILabel!
    var player: AVAudioPlayer?
    
    let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
   // var counts: Mindfulness?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView(view: sessionsDoneView)
        
        //Set navigation appearance
        title = "Mindfulness"
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NotReallyBlack")!]
        navigationItem.standardAppearance = appearance
        
        //fetchMindfulnessCount()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //fetchMindfulnessCount()
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToDeepBreath", sender: self)
        playSound(soundName: "ClaireDeLune")
    }
    
    //MARK: - Play Sound Functio
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
                
    }
    
//    func fetchMindfulnessCount() {
//        do {
//            let context = appDelegate.persistentContainer.viewContext
//            let fetchRequest = Mindfulness.fetchRequest()
//
//            let data = try context.fetch(fetchRequest)
//            counts = data
//
//        } catch {
//            print(error)
//        }
//
//    }
    
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
