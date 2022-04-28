//
//  ViewController.swift
//  OwnMind
//
//  Created by Zidan Ramadhan on 25/04/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var startView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setView(view: startView)
        
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToInput", sender: self)
    }
    
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

