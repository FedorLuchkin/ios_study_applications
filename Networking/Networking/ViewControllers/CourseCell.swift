//
//  CourseCell.swift
//  Networking
//
//  Created by Fixed on 14.05.2023.
//

import UIKit

class CourseCell: UITableViewCell {
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var numberOfLessons: UILabel!
    @IBOutlet weak var numberOfTests: UILabel!
    
    func configure(with course: Course) {
        let maxLen: Int = 35
        if let name = course.name, name.count > maxLen {
            if let theRange = name.prefix(maxLen).range(of: " ", options: .backwards) {
                courseNameLabel.text = name[...theRange.lowerBound] + "\n" + name[theRange.upperBound...]
            }
        } else {
            courseNameLabel.text = course.name
        }

        numberOfLessons.text = "Number of lessons: \(course.number_of_lessons ?? 0)"
        numberOfTests.text = "Number of tests: \(course.number_of_tests ?? 0)"
        
        guard let url = URL(string: course.imageUrl ?? "") else { return }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                self.courseImage.image = UIImage(systemName: "checkerboard.rectangle")
                return
            }
            DispatchQueue.main.async {
                self.courseImage.image = UIImage(data: imageData)
            }
        }
    }
}

