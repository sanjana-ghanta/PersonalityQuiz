//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Student AM on 5/06/22.
//

import UIKit

class QuestionViewController: UIViewController {

    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multiLabel1: UILabel!
    @IBOutlet var multiLabel2: UILabel!
    @IBOutlet var multiLabel3: UILabel!
    @IBOutlet var multiLabel4: UILabel!
    @IBOutlet var multiSwitch1: UISwitch!
    @IBOutlet var multiSwitch2: UISwitch!
    @IBOutlet var multiSwitch3: UISwitch!
    @IBOutlet var multiSwitch4: UISwitch!
    
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabel1: UILabel!
    @IBOutlet var rangedLabel2: UILabel!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    @IBOutlet var rangedSlider: UISlider!
    
    
    var questionIndex = 0
    var answersChosen: [Answer] = []
    
    var questions: [Question] = [
    Question(text: "What is something you would do given the chance?",
             type: .single,
             answers: [
                Answer(text: "Going to Space", type: .cookie),
                Answer(text: "Visiting Historical Places", type: .iceCream),
                Answer(text: "Competing on TV", type: .chocolate),
                Answer(text: "Spend an evening with family in your dream place!", type: .honey),
             ]
    ),
        
    Question(text: "What is your type of music?",
             type: .multiple,
            answers: [
                Answer(text: "I like pop but also rap!", type: .cookie),
                Answer(text: "I like accoustic music", type: .iceCream),
                Answer(text: "I like classical music.", type: .chocolate),
                Answer(text: "I like many many genres!", type: .honey),
            ]
    ),
    Question(text: "You got a really bad grade on a test, what's your reaction?",
             type: .single,
            answers: [
                Answer(text: "I should make plan on how I'll do better.", type: .cookie),
                Answer(text: "There goes my grade.", type: .iceCream),
                Answer(text: "I have to do better, I'm so dissapointed.", type: .chocolate),
            Answer(text: "There's next time! Everything is a learning curve!", type: .honey),
            ]
        ),
    Question(text: "What would you do in your free time?",
            type: .multiple,
                answers: [
                Answer(text: "Randomly do activities based on what I feel like.", type: .cookie),
                Answer(text: "Be indoors and just chill while watching Netflix.", type: .iceCream),
                Answer(text: "Study some books and watch documentaries.", type: .chocolate),
                Answer(text: "Spending time with my loved ones!", type: .honey),
                ]
            ),
        Question(text: "You are planning your outfit, what do you choose?",
                type: .ranged,
                    answers: [
                    Answer(text: "Whatever fits the weather and is comfortable.", type: .cookie),
                    Answer(text: "I'm wearing many layers of clothing with accesorries.", type: .iceCream),
                    Answer(text: "I would have to look presentable and perfect for the occasion.", type: .chocolate),
                    Answer(text: "Fun colorful clothing matched with neutrals and pastels!", type: .honey),
                    ]
                ),
        Question(text: "You are stranded alone on an island, what do you bring?",
                type: .ranged,
                    answers: [
                    Answer(text: "A hammock.", type: .cookie),
                    Answer(text: "Alvin and the Chipmunks.", type: .iceCream),
                    Answer(text: "A first aid kit and a scout's survival kit!", type: .chocolate),
                    Answer(text: "A friend!", type: .honey),
                    ]
                ),
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) /
            Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers[0].text
        rangedLabel2.text = answers[1].text
        
    }
    

    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }

    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, responses: answersChosen)
    }
    
}
