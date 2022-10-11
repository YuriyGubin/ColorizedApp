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
    
    var color: UIColor!
    
    @IBOutlet var redSlider: UISlider! {
        didSet {
            redSlider.minimumTrackTintColor = .red
            redSlider.maximumTrackTintColor = .red.withAlphaComponent(0.2)
        }
    }
    @IBOutlet var greenSlider: UISlider! {
        didSet {
            greenSlider.minimumTrackTintColor = .green
            greenSlider.maximumTrackTintColor = .green.withAlphaComponent(0.2)
        }
    }
    @IBOutlet var blueSlider: UISlider! {
        didSet {
            blueSlider.minimumTrackTintColor = .blue
            blueSlider.maximumTrackTintColor = .blue.withAlphaComponent(0.2)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorizedView.layer.cornerRadius = 15
        setColor()
        setValue()
        
    }
    
    @IBAction func slidersAction(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: sender)
        case greenSlider:
            greenValueLabel.text = string(from: sender)
        default:
            blueValueLabel.text = string(from: sender)
        }
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
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.02f", slider.value)
    }
}
