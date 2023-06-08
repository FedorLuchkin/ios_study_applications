//
//  MainViewController.swift
//  ColorSlidersTask
//
//  Created by Fixed on 07.05.2023.
//

protocol viewColorSetterDelegate {
    func setMainViewColor(newColor: UIColor)
}

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        guard let settedColor = view.backgroundColor else { return }
        settingsVC.settedColor = settedColor
        settingsVC.delegate = self
    }

}

extension MainViewController: viewColorSetterDelegate {
    func setMainViewColor(newColor: UIColor) {
        view.backgroundColor = newColor
        
        let ciSettedColor = CIColor(color: newColor)
        mainLabel.textColor = UIColor(
            red: CGFloat(1 - ciSettedColor.red),
            green: CGFloat(1 - ciSettedColor.green),
            blue: CGFloat(1 - ciSettedColor.blue),
            alpha: 1
        )
    }
}
