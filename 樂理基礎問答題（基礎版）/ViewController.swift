//
//  ViewController.swift
//  樂理基礎問答題（基礎版）
//
//  Created by 蔡佳穎 on 2021/5/10.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var questionImageVew: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    var questions = [Question]()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question1 = Question(description: "請說出名稱", answer: "高音譜記號")
        questions.append(question1)
        let question2 = Question(description: "請說出名稱", answer: "低音譜記號")
        questions.append(question2)
        let question3 = Question(description: "請說出名稱", answer: "大譜表")
        questions.append(question3)
        let question4 = Question(description: "請說出音符於第幾線或第幾間", answer: "第二線")
        questions.append(question4)
        let question5 = Question(description: "請說出音符於第幾線或第幾間", answer: "第三間")
        questions.append(question5)
        let question6 = Question(description: "請說出音符於第幾線或第幾間", answer: "第五線")
        questions.append(question6)
        let question7 = Question(description: "請說出名稱", answer: "八分音符")
        questions.append(question7)
        let question8 = Question(description: "請說出名稱", answer: "四分休止符")
        questions.append(question8)
        let question9 = Question(description: "請說出名稱", answer: "升記號")
        questions.append(question9)
        let question10 = Question(description: "請說出名稱", answer: "降記號")
        questions.append(question10)
        
        questionImageVew.image = UIImage(named: questions[index].answer)
        questionLabel.text = questions[index].description
        questionLabel.sizeToFit()
        answerLabel.text = ""
    }
    @IBAction func showAnswer(_ sender: UIButton) {
        answerLabel.text = questions[index].answer
        answerLabel.sizeToFit()
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        index += 1
        if index <= 9 {
            questionLabel.frame = CGRect(x: 96, y: 54, width: 187, height: 0)
            questionImageVew.image = UIImage(named: questions[index].answer)
            questionLabel.text = questions[index].description
            questionLabel.sizeToFit()
            answerLabel.text = ""
            
            progressSlider.value = Float(index+1)
            progressLabel.text = "\(index+1) / 10"
            progressLabel.sizeToFit()
        } else {
            questionLabel.frame = CGRect(x: 96, y: 54, width: 187, height: 0)
            questionImageVew.image = UIImage(named: "beethoven.jpeg")
            questionLabel.text = "還不熟的話，可以在練習一次喔！"
            questionLabel.sizeToFit()
            answerLabel.text = ""
        }
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        questions.shuffle()
        index = 0
        questionImageVew.image = UIImage(named: questions[index].answer)
        questionLabel.text = questions[index].description
        questionLabel.sizeToFit()
        answerLabel.text = ""
        
        progressSlider.value = Float(index+1)
        progressLabel.text = "\(index+1) / 10"
        progressLabel.sizeToFit()
    }
    
    @IBAction func speakAnswer(_ sender: UIButton) {
        let speak = AVSpeechUtterance(string: questions[index].answer)
        speak.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speak)
    }
}

