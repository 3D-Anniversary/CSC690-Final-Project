//
//  QuizViewController.swift
//  MusicQuiz
//
//  Created by Yaoxiong Wu on 12/8/21.
//  Copyright © 2021 Yaoxiong Wu. All rights reserved.
//

import UIKit

protocol QuestionProtocol {
    
}

struct ScalesQuestion: QuestionProtocol {
    let answer: String
    let type: String
}

struct AccentQuestion: QuestionProtocol {
    let prompt: String
    let answer: Int
    let accent: String
}


class QuizViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var progressTotal: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    
    @IBOutlet weak var prompt: UILabel!
    @IBOutlet weak var accent: UILabel!
    @IBOutlet weak var pickerDoneButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nextScreenButton: UIButton!
    
    @IBOutlet weak var numberOfAccent: UITextField!
    @IBOutlet weak var scalesAnswer: UIButton!
    @IBOutlet weak var indication: UILabel!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var answerPicker: UIPickerView!
    
    var score: Int = 0
    
    var numberAsInteger: Int? {
        guard
            let userInput = numberOfAccent.text,
            !userInput.isEmpty,
            let accentNumber = Int(userInput)
            else {
                return nil
        }
        return accentNumber
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        guard let currentIndex = currentQuestionIndex else {
            showNextQuestion()
            return
        }
        guard let accentQuestion = questionBank[currentIndex] as? AccentQuestion
            else {
                checkIfScalesQuestion()
                return
        }
        
        guard let number = numberAsInteger else {
            numberOfAccent.text = "No input"
            return
        }
        
        indication.isHidden = false
        let userWasCorrect = accentQuestion.answer == number
        if (userWasCorrect) {
            indication.textColor = UIColor.green
            indication.text = "Correct!"
            score = score + 1
        }
        else {
            indication.textColor = UIColor.red
            indication.text = "Incorrect."
        }
        
        numberOfAccent.isEnabled = false
        doneButton.isHidden = true
        guard currentIndex + 1 < questionsPerQuiz else {
            nextScreenButton.isHidden = false
            return
        }
        nextButton.isHidden = false
        
    }
    
    let questionsPerQuiz: Int = 5;
    
    var questionBank: [QuestionProtocol] = [
        ScalesQuestion(answer: "C", type: "Major"),
        ScalesQuestion(answer: "G", type: "Major"),
        ScalesQuestion(answer: "D", type: "Major"),
        ScalesQuestion(answer: "A", type: "Major"),
        ScalesQuestion(answer: "E", type: "Major"),
        ScalesQuestion(answer: "B", type: "Major"),
        ScalesQuestion(answer: "F#", type: "Major"),
        ScalesQuestion(answer: "F", type: "Major"),
        ScalesQuestion(answer: "Bb", type: "Major"),
        ScalesQuestion(answer: "Eb", type: "Major"),
        ScalesQuestion(answer: "Ab", type: "Major"),
        ScalesQuestion(answer: "Db", type: "Major"),
        ScalesQuestion(answer: "A", type: "minor"),
        ScalesQuestion(answer: "E", type: "minor"),
        ScalesQuestion(answer: "B", type: "minor"),
        ScalesQuestion(answer: "F#", type: "minor"),
        ScalesQuestion(answer: "C#", type: "minor"),
        ScalesQuestion(answer: "G#", type: "minor"),
        ScalesQuestion(answer: "D#", type: "minor"),
        ScalesQuestion(answer: "D", type: "minor"),
        ScalesQuestion(answer: "G", type: "minor"),
        ScalesQuestion(answer: "C", type: "minor"),
        ScalesQuestion(answer: "F", type: "minor"),
        ScalesQuestion(answer: "Bb", type: "minor"),
        AccentQuestion(prompt: "How many sharps is in C Major?", answer: 0, accent: "sharps"),
        AccentQuestion(prompt: "How many sharps is in G Major?", answer: 1, accent: "sharps"),
        AccentQuestion(prompt: "How many sharps is in D Major?", answer: 2, accent: "sharps"),
        AccentQuestion(prompt: "How many sharps is in A Major?", answer: 3, accent: "sharps"),
        AccentQuestion(prompt: "How many sharps is in E Major?", answer: 4, accent: "sharps"),
        AccentQuestion(prompt: "How many sharps is in B Major?", answer: 5, accent: "sharps"),
        AccentQuestion(prompt: "How many sharps is in F# Major?", answer: 6, accent: "sharps"),
        AccentQuestion(prompt: "How many flats is in F Major?", answer: 1, accent: "flats"),
        AccentQuestion(prompt: "How many flats is in Bb Major?", answer: 2, accent: "flats"),
        AccentQuestion(prompt: "How many flats is in Eb Major?", answer: 3, accent: "flats"),
        AccentQuestion(prompt: "How many flats is in Ab Major?", answer: 4, accent: "flats"),
        AccentQuestion(prompt: "How many flats is in Db Major?", answer: 5, accent: "flats"),
        AccentQuestion(prompt: "How many sharps is in A minor?", answer: 0, accent: "sharps"),
        AccentQuestion(prompt: "How many sharps is in E minor?", answer: 1, accent: "sharps"),
        AccentQuestion(prompt: "How many sharps is in B minor?", answer: 2, accent: "sharps"),
        AccentQuestion(prompt: "How many sharps is in F# minor?", answer: 3, accent: "sharps"),
        AccentQuestion(prompt: "How many sharps is in C# minor?", answer: 4, accent: "sharps"),
        AccentQuestion(prompt: "How many sharps is in G# minor?", answer: 5, accent: "sharps"),
        AccentQuestion(prompt: "How many sharps is in D# minor?", answer: 6, accent: "sharps"),
        AccentQuestion(prompt: "How many flats is in D minor?", answer: 1, accent: "flats"),
        AccentQuestion(prompt: "How many flats is in G minor?", answer: 2, accent: "flats"),
        AccentQuestion(prompt: "How many flats is in C minor?", answer: 3, accent: "flats"),
        AccentQuestion(prompt: "How many flats is in F minor?", answer: 4, accent: "flats"),
        AccentQuestion(prompt: "How many flats is in Bb minor?", answer: 5, accent: "flats"),
    ]
    
    var scalesChoice: [String] = ["C", "C#", "Db", "D", "D#", "Eb", "E", "F", "F#", "G", "G#", "Ab", "A", "Bb", "B"]
    
    var typesChoice: [String] = ["Major", "minor"]
    
    var currentQuestionIndex: Int? = -1
    
    @IBAction func chooseAnswer(_ sender: UIButton) {
        outerView.isHidden = false
    }
    
    @IBAction func doneChooseAnswer(_ sender: UIButton) {
        let scalesIndex = answerPicker.selectedRow(inComponent: 0)
        let typesIndex = answerPicker.selectedRow(inComponent: 1)
        let selectedChoice = "\(scalesChoice[scalesIndex]) \(typesChoice[typesIndex])"
        scalesAnswer.setTitle(selectedChoice, for: .normal)
        outerView.isHidden = true
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        showNextQuestion()
    }
    
    func checkIfScalesQuestion() {
        if (scalesAnswer.currentTitle == "Choose Answer") {
            scalesAnswer.setTitle("Please Choose Answer", for: .normal)
            return
        }
        
        if (scalesAnswer.currentTitle == "Please Choose Answer") {
            return
        }
        
        guard let currentIndex = currentQuestionIndex else {
            showNextQuestion()
            return
        }
        
        guard let scalesQuestion = questionBank[currentIndex] as? ScalesQuestion
            else {
                showNextQuestion()
                return
        }
        
        indication.isHidden = false
        let userWasCorrect = ("\(scalesQuestion.answer) \(scalesQuestion.type)") == scalesAnswer.currentTitle
        
        if (userWasCorrect) {
            indication.textColor = UIColor.green
            indication.text = "Correct!"
            score = score + 1
        }
        else {
            indication.textColor = UIColor.red
            indication.text = "Incorrect."
        }
        
        doneButton.isHidden = true
        guard currentIndex + 1 < questionsPerQuiz else {
            nextScreenButton.isHidden = false
            return
        }
        nextButton.isHidden = false
        
    }
    
    func showNextQuestion() {
        indication.isHidden = true
        nextButton.isHidden = true
        doneButton.isHidden = false
        if (scalesAnswer.currentTitle != "Choose Answer") {
            scalesAnswer.setTitle("Choose Answer", for: .normal)
        }
        guard let currentIndex = currentQuestionIndex else {
            prompt.text = "Current question index was nil"
            reset()
            return
        }
        let nextIndex = currentIndex + 1
        if (nextIndex < questionsPerQuiz) {
            let questionCount = nextIndex + 1
            progressTotal.text = "Question \(questionCount) of \(questionsPerQuiz)"
            progress.progress = Float(questionCount) / Float(questionsPerQuiz)
        } else {
            doneButton.isHidden = true
            nextScreenButton.isHidden = false
            return
        }
        
        currentQuestionIndex = nextIndex
        
        let question = questionBank[nextIndex]
        
        switch question {
        case let scalesQuestion as ScalesQuestion:
            prompt.text = "What scale is this?"
            numberOfAccent.isHidden = true
            accent.isHidden = true
            scalesAnswer.isHidden = false
            print("\(scalesQuestion.answer) \(scalesQuestion.type)");
        case let accentQuestion as AccentQuestion:
            prompt.text = accentQuestion.prompt
            accent.text = accentQuestion.accent
            scalesAnswer.isHidden = true
            numberOfAccent.isHidden = false
            numberOfAccent.isEnabled = true
            accent.isHidden = false
        default: break
        }
    }
    
    func reset() {
        questionBank = questionBank.shuffled()
        currentQuestionIndex = -1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerPicker.delegate = self
        answerPicker.dataSource = self
        progress.progress = 0
        reset()
        showNextQuestion()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: return scalesChoice.count
        default: return typesChoice.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0: return scalesChoice[row]
        default: return typesChoice[row]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CongratulationViewController {
            destination.score = self.score
            destination.total = questionsPerQuiz
        }
    }
    
    
}


