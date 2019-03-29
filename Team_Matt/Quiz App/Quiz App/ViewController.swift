//
//  ViewController.swift
//  Quiz App
//
//  Created by Kalen Hammann on 3/21/19.
//  Copyright © 2019 Human Family. All rights reserved.
//

import UIKit

    var answers = ["Michael Jackson", "The Patriots", "The Rams", " The Red Sox"]

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return answers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return answers[row]
    }
    
    

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerPicker: UIPickerView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    @IBAction func submitButton(_ sender: Any) {
        let userAnswer = answerPicker.selectedRow(inComponent: 0)
        if userAnswer == 1 {
            resultLabel.text = "You got this one right!"
        } else {
            resultLabel.text = "Amazing! You got it wrong!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        answerPicker.delegate = self
        answerPicker.dataSource = self
        
    }


}

