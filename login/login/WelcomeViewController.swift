//
//  WelcomeViewController.swift
//  login
//
//  Created by Fixed on 04.05.2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var userName: String!

    @IBOutlet weak var welcomeLAbel: UILabel!
    
    
    // @IBAction func logOutPressed() {
    //     dismiss(animated: true)
    // }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLAbel.text = "Welcome \(userName!)"
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemPurple.cgColor, UIColor.systemPink.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
