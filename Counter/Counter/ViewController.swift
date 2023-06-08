//
//  ViewController.swift
//  Counter
//
//  Created by Fixed on 20.04.2023.
//

import UIKit

class ViewController: UIViewController {
    private var counter: Int = 0
    private let dateFormatter = DateFormatter()
    @IBOutlet private weak var historyTextView: UITextView!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    
    private func decrementCounter() {
        if counter > 0 {
            counter -= 1
            counterLabel.text = String(counter)
            historyTextView.insertText("\(dateFormatter.string(from: Date())): значение изменено на -1\n")
        } else {
            historyTextView.insertText("\(dateFormatter.string(from: Date())): попытка уменьшить значение счётчика ниже 0\n")
        }
    }
    
    private func incrementCounter() {
        counter += 1
        counterLabel.text = String(counter)
        historyTextView.insertText("\(dateFormatter.string(from: Date())): значение изменено на +1\n")
    }
    
    private func resetCounter() {
        counter = 0
        counterLabel.text = String(counter)
        historyTextView.insertText("\(dateFormatter.string(from: Date())): значение сброшено\n")
    }
    
    private func setupViews() {
        dateFormatter.dateFormat = "dd MMM YYYY HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US")
        
        historyTextView.layer.cornerRadius = 35
        historyTextView.insertText("\nИстория изменений:\n")
        historyTextView.layer.borderWidth = 2

        counterLabel.layer.cornerRadius = 35
        counterLabel.layer.borderWidth = 3
        counterLabel.layer.masksToBounds = true
        
        counterLabel.text = String(counter)
        
        plusButton.tintColor = UIColor.systemRed
        plusButton.layer.cornerRadius = 35
        plusButton.layer.borderWidth = 1
        plusButton.layer.masksToBounds = true
        
        minusButton.tintColor = UIColor.systemBlue
        minusButton.layer.cornerRadius = 35
        minusButton.layer.borderWidth = 1
        minusButton.layer.masksToBounds = true
        
        resetButton.tintColor = UIColor.systemGray
        resetButton.layer.cornerRadius = 35
        resetButton.layer.borderWidth = 1
        resetButton.layer.masksToBounds = true
    }
    
    @IBAction private func plusButtonDidTap(_ sender: Any) {
        incrementCounter()
    }
    
    @IBAction private func minusButtonDidTap(_ sender: Any) {
        decrementCounter()
    }
    
    @IBAction private func resetButtonDidTap(_ sender: Any) {
        resetCounter()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}
