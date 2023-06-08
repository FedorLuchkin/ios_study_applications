//
//  ViewController.swift
//  login
//
//  Created by Fixed on 03.05.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var userNameTF: UITextField!
    
    // MARK: - Private properties
    private let user = "ABOBA"
    private let password = "123"
    
    // MARK: - IB Actions
    @IBAction func logInPressed() {
        if userNameTF.text != user || passwordTF.text != password {
            showAlert(
                title: "Invalid registration data",
                message: "Please, enter correct login and password",
                textField: passwordTF
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(
                title: "Ooops!",
                message: "Your login is \(user)"
            )
            : showAlert(
                title: "Ooops!",
                message: "Your password is \(password)"
            )
    }
    
    
    @IBAction func logOutPressed(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userNameTF.text
    }
    
    // MARK: - Alerts
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemCyan.cgColor, UIColor.white.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        userNameTF.becomeFirstResponder()
    }
}

// MARK: - Keyboard
extension MainViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInPressed()
        }
        return true
    }
}
