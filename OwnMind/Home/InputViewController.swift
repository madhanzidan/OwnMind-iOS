//
//  DetailViewController.swift
//  OwnMind
//
//  Created by Zidan Ramadhan on 27/04/22.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items: [Journal]?

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var happenedTextField: UITextField!
    @IBOutlet weak var triggerTextField: UITextField!
    @IBOutlet weak var emotionTextField: UITextField!
    @IBOutlet weak var thoughtsTextField: UITextField!
    @IBOutlet weak var differentTextField: UITextField!
    @IBOutlet weak var newThoughtsTextField: UITextField!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadDayData(Date())
        self.createDatePicker()
        self.dateTextField.delegate = self
        dateTextField.returnKeyType = .done
        self.happenedTextField.delegate = self
        happenedTextField.returnKeyType = .done
        self.triggerTextField.delegate = self
        triggerTextField.returnKeyType = .done
        self.emotionTextField.delegate = self
        emotionTextField.returnKeyType = .done
        self.thoughtsTextField.delegate = self
        thoughtsTextField.returnKeyType = .done
        self.differentTextField.delegate = self
        differentTextField.returnKeyType = .done
        self.newThoughtsTextField.delegate = self
        newThoughtsTextField.returnKeyType = .done
    }
    
    //Dissmiss the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        
        if happenedTextField.text == "" {
            showAlert(title: "Need to Fill", body: "At least you should fill about 'What happened?' on that day")
        } else {
            self.dismiss(animated: true)
            
            let newJournal = Journal(context: self.context)
            newJournal.date = dateTextField.text
            newJournal.happened = happenedTextField.text
            newJournal.trigger = triggerTextField.text
            newJournal.feel = emotionTextField.text
            newJournal.thoughts = thoughtsTextField.text
            newJournal.different = differentTextField.text
            newJournal.newThoughts = newThoughtsTextField.text
            
            //Save the data
            do {
                try self.context.save()
            } catch {
                print(error)
            }
        }
        
        

    }
    
    func showAlert(title: String, body: String) {
        let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
        let alertAction = UIAlertAction.init(title: "OK", style: .default) { action in
            alert.dismiss(animated: true)
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func createDatePicker() {
        //date picker mode
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.maximumDate = Date()
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        dateTextField.inputAccessoryView = toolbar
        dateTextField.inputView = datePicker
        dateTextField.textAlignment = .center
    }
    
    func loadDayData(_ date: Date) {
        //formatter to show date on textfield
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let dateSelectedString = formatter.string(from: date)
        dateTextField.text = dateSelectedString
        
    }
    
    @objc func donePressed() {
        self.loadDayData(datePicker.date)
        self.view.endEditing(true)
    }

}
