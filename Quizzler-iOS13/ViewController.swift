//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quiz = [
        ["Four + two is equal six.", true],
        ["Five - three is greater than one.", false],
        ["Three + Eight is less than Ten", false]
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionText.text = quiz[questionNumber][0]
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        questionNumber += 1
        if questionNumber >= quiz.count {
            questionNumber = 0
        }
        updateUI()
    }
    
    func updateUI() {
        questionText.text = quiz[questionNumber][0]
    }
}

