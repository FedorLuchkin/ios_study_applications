//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Fixed on 05.05.2023.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!

    var answersChoosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupUI()
    }
}

// MARK: - Private Methods
extension ResultsViewController {
    private func setupUI() {
        guard let resultAnimal = resultCalculate() else { return }
        resultLabel.text = "Вы - \(resultAnimal.rawValue)"
        resultDescriptionLabel.text = resultAnimal.definition
    }
    
    private func resultCalculate() -> AnimalType? {
        let mappedTypes = answersChoosen.map { ($0.type, 1) }
        let animalCounts = Dictionary(mappedTypes, uniquingKeysWith: +)
        return animalCounts.max(by:{$0.value < $1.value})?.key
    }
}
