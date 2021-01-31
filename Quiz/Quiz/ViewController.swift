//
//  ViewController.swift
//  Quiz
//
//  Created by Admin on 31.01.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func startGame() {
        let vc = storyboard?.instantiateViewController(identifier: "Quiz" ) as! QuizViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc , animated: true)
    }

}

	

