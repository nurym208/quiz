//
//  QuizViewController.swift
//  Quiz
//
//  Created by Admin on 31.01.2021.
//

import UIKit

class QuizViewController: UIViewController, UITableViewDelegate,UITableViewDataSource	 {
    var quizModels = [Question]()
    var currentQuestion: Question?
    @IBOutlet var label: UILabel!
    @IBOutlet var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestion()
               
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureUI(question:quizModels.first!)
    }
   
    private func configureUI(question:Question) {
        label.text = question.text
        currentQuestion = question
        table.delegate = self
        table.dataSource = self
        
    }
    private func checkAnswer(answer:Answer,question:Question) ->Bool {
        return question.answers.contains(where: {$0.text == answer.text	}) && answer.correct
        
    }
    private func setupQuestion(){
        quizModels.append(Question(text: "What is my name&", answers: [
             Answer(text: "Alikhan ", correct: false),
            Answer(text: "Nurym", correct: true),
            Answer(text: "Alpamys", correct: false),
            Answer(text:"Anelya", correct:false)
        
        ]))
        quizModels.append(Question(text: "What is 2 + 2", answers: [
             Answer(text: "4 ", correct: true),
            Answer(text: "6", correct: false),
            Answer(text: "9", correct: false),
            Answer(text:"10", correct:false)
        
        ]))
        quizModels.append(Question(text: "Which group is the best?", answers: [
             Answer(text: "MT1901 ", correct: false),
            Answer(text: "MT1902", correct: false),
            Answer(text: "SE1909", correct: false),
            Answer(text:"MT1903", correct:true)
        
        ]))
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion?.answers.count ?? 0
           }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = currentQuestion?.answers[indexPath.row].text
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let question = currentQuestion else {
            return
        }
        let answer = question.answers[indexPath.row]
        
        
        if checkAnswer(answer: answer, question: question){
            if let index = 	quizModels.firstIndex(where: {$0.text == question.text}) {
                if index < (quizModels.count - 1)(
                let nextquestion = quizModels[index+1]
                configureUI(question: nextquestion)
                table.reloadData()
            }
        }
            else {
                let alert = UIAlertController(title: "done", message: "awesome", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler: nil))
                present(alert, animated: true)
            }
        
        else do {
            let alert = UIAlertController(title: "Wrong", message: "don t worry", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            
        }
    }
    



struct Question {
    let text: String
    let answers:[Answer]
}
struct Answer {
    let	text: String
    let correct:Bool
}
}
