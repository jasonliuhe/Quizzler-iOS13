//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var secondAnswer: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionText.text = quizBrain.getQuizText()
        score.text = "Score: \(quizBrain.getScore())"
        print(quizBrain.getAnswer()[1])
        trueButton.setTitle(quizBrain.getAnswer()[0], for: .normal)
        secondAnswer.setTitle(quizBrain.getAnswer()[1], for: .normal)
        falseButton.setTitle(quizBrain.getAnswer()[2], for: .normal)
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! 
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
    
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionText.text = quizBrain.getQuizText()
        score.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
        trueButton.setTitle(quizBrain.getAnswer()[0], for: .normal)
        secondAnswer.setTitle(quizBrain.getAnswer()[1], for: .normal)
        falseButton.setTitle(quizBrain.getAnswer()[2], for: .normal)
        trueButton.backgroundColor = UIColor.clear
        secondAnswer.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
}

