//
//  ViewController.swift
//  traffic_lights
//
//  Created by Fixed on 26.04.2023.
//

import UIKit

private enum CurrentLIght {
    case red, yellowAfterRed, yellowAfterGreen, green
}

class ViewController: UIViewController {

    @IBOutlet private weak var redLightView: UIView!
    @IBOutlet private weak var yellowLightView: UIView!
    @IBOutlet private weak var greenLightView: UIView!
    
    @IBOutlet private weak var startButton: UIButton!
    
    private var currentLight = CurrentLIght.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    @IBAction private func starButtonDidTap() {
        switch currentLight{
        case .red:
            yellowLightView.alpha = lightIsOff
            redLightView.alpha = lightIsOn
            currentLight = .yellowAfterRed
        case .yellowAfterRed:
            redLightView.alpha = lightIsOff
            yellowLightView.alpha = lightIsOn
            currentLight = .green
        case .green:
            yellowLightView.alpha = lightIsOff
            greenLightView.alpha = lightIsOn
            currentLight = .yellowAfterGreen
        default:
            greenLightView.alpha = lightIsOff
            yellowLightView.alpha = lightIsOn
            currentLight = .red
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        redLightView.backgroundColor = .red
        redLightView.alpha = lightIsOff
        
        yellowLightView.backgroundColor = .yellow
        yellowLightView.alpha = lightIsOff
        
        greenLightView.backgroundColor = .green
        greenLightView.alpha = lightIsOff
        
        startButton.backgroundColor = .systemBlue
        startButton.titleLabel?.textColor = .white
        startButton.backgroundColor = UIColor.systemBlue
        startButton.tintColor = .white
        
        
    }
    
    override func viewWillLayoutSubviews() {
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
        startButton.layer.cornerRadius = startButton.frame.height / 2
    }
    
}

