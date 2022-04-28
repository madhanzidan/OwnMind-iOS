//
//  DetailViewController.swift
//  OwnMind
//
//  Created by Zidan Ramadhan on 28/04/22.
//

import UIKit

class DetailViewController: UIViewController {

    var items: Journal?
    
    @IBOutlet weak var happenedTextView: UITextView!
    @IBOutlet weak var triggerTextView: UITextView!
    @IBOutlet weak var feelTextView: UITextView!
    @IBOutlet weak var thoughtsTextView: UITextView!
    @IBOutlet weak var differentTextView: UITextView!
    @IBOutlet weak var newThoughtsTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = items?.date
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NotReallyWhite")!]
        navigationItem.standardAppearance = appearance
        
        setView(view: happenedTextView)
        setView(view: triggerTextView)
        setView(view: feelTextView)
        setView(view: thoughtsTextView)
        setView(view: differentTextView)
        setView(view: newThoughtsTextView)
        
        happenedTextView.text = items?.happened
        triggerTextView.text = items?.trigger
        feelTextView.text = items?.feel
        thoughtsTextView.text = items?.thoughts
        differentTextView.text = items?.different
        newThoughtsTextView.text = items?.newThoughts
        
    }
    
    func setView(view: UITextView){
        // corner radius
        view.layer.cornerRadius = 10

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
