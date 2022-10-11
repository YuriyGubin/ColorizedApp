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
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    @IBOutlet var redSlider: UISlider! {
        didSet {
            redSlider.minimumTrackTintColor = .red
            redSlider.maximumTrackTintColor = .red.withAlphaComponent(0.2)
            redSlider.value = Float(viewColor.rgba.red)
        }
    }
    @IBOutlet var greenSlider: UISlider! {
        didSet {
            greenSlider.minimumTrackTintColor = .green
            greenSlider.maximumTrackTintColor = .green.withAlphaComponent(0.2)
            greenSlider.value = Float(viewColor.rgba.green)
        }
    }
    @IBOutlet var blueSlider: UISlider! {
        didSet {
            blueSlider.minimumTrackTintColor = .blue
            blueSlider.maximumTrackTintColor = .blue.withAlphaComponent(0.2)
            blueSlider.value = Float(viewColor.rgba.blue)
        }
    }
    
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorizedView.layer.cornerRadius = 15
        setColor()
        setValue()
        
    }
    // MARK: - IBActions
    @IBAction func slidersAction(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: sender)
            redTF.text = string(from: sender)
        case greenSlider:
            greenValueLabel.text = string(from: sender)
            greenTF.text = string(from: sender)
        default:
            blueValueLabel.text = string(from: sender)
            blueTF.text = string(from: sender)
        }
    }
    
    // MARK: - private methods
    private func setColor() {
        colorizedView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue() {
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
        
        redTF.text = string(from: redSlider)
        greenTF.text = string(from: greenSlider)
        blueTF.text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.02f", slider.value)
    }
    
    internal override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

// MARK: - get components from UIColor instance
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
