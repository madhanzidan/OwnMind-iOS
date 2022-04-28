//
//  JournalViewController.swift
//  OwnMind
//
//  Created by Zidan Ramadhan on 27/04/22.
//

import UIKit

class JournalViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    var journalToSend: Journal?
    var items: [Journal]?
    var rowSelected: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set navigation appearance
        title = "Journal"
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NotReallyBlack")!]
        navigationItem.standardAppearance = appearance
        
        //Set tableView
        tableView.delegate = self
        tableView.dataSource = self
        fetchJournal() //Retrieve from CoreData
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchJournal()
    }
    
    func fetchJournal() {
        do {
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = Journal.fetchRequest() //Select *
            let data = try context.fetch(fetchRequest)
            items = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print(error)
        }
        
    }
}

//MARK: - Table View Extension
extension JournalViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JournalCell", for: indexPath)
        //Get journal array
        cell.textLabel?.text = items![indexPath.row].date
        cell.detailTextLabel?.text = items![indexPath.row].happened
        return cell
    }
    
    //MARK: - Swipe to Delete
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let action = UIContextualAction(style: .destructive, title: "Remove") { (action, view, completionHandler) in
            let context = self.appDelegate.persistentContainer.viewContext
            let dataToRemove = self.items![indexPath.row]
            
            //Remove Journal array data selected from CoreData
            context.delete(dataToRemove)
            
            //Save new data
            do {
                try context.save()
            } catch {
                print(error)
            }
            
            //Re-fetch data
            self.fetchJournal()
            
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    //MARK: - Segue goToDetail
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelected = indexPath.row
        journalToSend = items![indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController {
            detailVC.items = journalToSend //send all as 1 bundle
        }
    }
    
}
