import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var redLabel: UILabel!
    @IBOutlet private weak var greenLabel: UILabel!
    @IBOutlet private weak var blueLabel: UILabel!

    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var blueSlider: UISlider!
    
    var settedColor: UIColor!
    var delegate: viewColorSetterDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        colorView.layer.cornerRadius = 30
        colorView.layer.borderWidth = 8
        startSetings()
        setLabelValue(for: redLabel, greenLabel, blueLabel)
    }
    
    @IBAction private func rgbSlider(_ sender: UISlider) {
        setColor()
        switch sender {
            case redSlider:
                setLabelValue(for: redLabel)
            case greenSlider:
                setLabelValue(for: greenLabel)
            default:
                setLabelValue(for: blueLabel)
        }
    }
    
    @IBAction private func doneButtonPressed() {
        guard let color = colorView.backgroundColor else { return}
        delegate.setMainViewColor(newColor: color)
        dismiss(animated: true)
    }
}

extension SettingsViewController {
    private func startSetings() {
        colorView.backgroundColor = settedColor
        let ciSettedColor = CIColor(color: settedColor)
        redSlider.value = Float(ciSettedColor.red)
        greenSlider.value = Float(ciSettedColor.green)
        blueSlider.value = Float(ciSettedColor.blue)
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setLabelValue(for labels: UILabel...) {
        for label in labels {
            switch label {
            case redLabel:
                label.text = string(for: redSlider)
            case redLabel:
                label.text = string(for: greenSlider)
            default:
                label.text = string(for: blueSlider)
            }
        }
    }
    
    private func string(for slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
