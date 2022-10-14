//
//  SettingsViewController.swift
//  ColorizedApp
//
//  Created by Yuriy on 23.09.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    // MARK: - IBOutlets
    
    @IBOutlet var colorizedView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var viewColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    // MARK: - View life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorizedView.layer.cornerRadius = 15
        setupSliders()
        setColor()
        setValue()
        
        initDelegatesForTextFields()
        addButtonsToTextFields()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction func slidersAction(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redLabel.text = string(from: sender)
            redTF.text = string(from: sender)
        case greenSlider:
            greenLabel.text = string(from: sender)
            greenTF.text = string(from: sender)
        default:
            blueLabel.text = string(from: sender)
            blueTF.text = string(from: sender)
        }
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setBackgroundColor(with: UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        ))
        dismiss(animated: true)
    }
    
    // MARK: - Private methods
    private func initDelegatesForTextFields() {
        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
    }
    
    private func addButtonsToTextFields() {
        redTF.addDoneToolbar()
        greenTF.addDoneToolbar()
        blueTF.addDoneToolbar()
    }
    
    private func setupSliders() {
        redSlider.minimumTrackTintColor = .red
        redSlider.maximumTrackTintColor = .red.withAlphaComponent(0.2)
        
        greenSlider.minimumTrackTintColor = .green
        greenSlider.maximumTrackTintColor = .green.withAlphaComponent(0.2)
        
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.maximumTrackTintColor = .blue.withAlphaComponent(0.2)
        
        redSlider.value = Float(viewColor.rgba.red)
        greenSlider.value = Float(viewColor.rgba.green)
        blueSlider.value = Float(viewColor.rgba.blue)
    }
    
    private func setColor() {
        colorizedView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue() {
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
        
        redTF.text = string(from: redSlider)
        greenTF.text = string(from: greenSlider)
        blueTF.text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.02f", slider.value)
    }
}

// MARK: - Alert controller
extension SettingsViewController {
    func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = "1.00"
            textField?.becomeFirstResponder()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        
        if textField != redTF {
            textField.inputAccessoryView = keyboardToolbar
        }
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: textField,
            action: #selector(resignFirstResponder)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
        
        if let value = Float(textField.text ?? ""), value >= 0, value <= 1 {
            switch textField {
            case redTF:
                redSlider.value = value
                redLabel.text = string(from: redSlider)
            case greenTF:
                greenSlider.value = value
                greenLabel.text = string(from: greenSlider)
            default:
                blueSlider.value = value
                blueLabel.text = string(from: blueSlider)
            }
        } else {
            showAlert(title: "Wrong format", message: "You should  to use range from 0 to 1", textField: textField)
        }
        
        setColor()
    }
}


//// MARK: - Add Done button
//// From google. Ничего не понял, но очень интересно
//extension UITextField {
//    func addDoneToolbar(onDone: (target: Any, action: Selector)? = nil) {
//        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
//        let toolbar = UIToolbar()
//        toolbar.items = [
//            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
//            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
//        ]
//        toolbar.sizeToFit()
//        self.inputAccessoryView = toolbar
//    }
//    @objc func doneButtonTapped() {
//        resignFirstResponder()
//    }
//}


// MARK: - Get components from UIColor instance
// From google
extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r, g, b, a)
    }
}
