//
//  AddViewController.swift
//  DeathNote
//
//  Created by Samantha HILLEBRAND on 2019/10/10.
//  Copyright © 2019 Samantha HILLEBRAND. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBAction func doneButton(_ sender: Any) {
        print (nameTextField.text!)
        print (textDescription.text!)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM YYYY HH:mm"
        let somedateString = dateFormatter.string(from: datePicker.date)
        print (somedateString)
        
        if nameTextField.text?.isEmpty ?? true {
            print("nameTextField is empty")
        } else {
            dataModels.append(DataModel(deathName: nameTextField.text!, deathDate: somedateString, deathDescription: textDescription.text!))
        }
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var textDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentDate = Date()
        datePicker.minimumDate = currentDate
        descriptionTextView!.layer.borderWidth = 1
        descriptionTextView!.layer.borderColor = UIColor.lightGray.cgColor
    }

    //Hides keyboard when done
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    

    
}
