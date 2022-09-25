//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Yuriy on 23.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorizedView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        colorizedView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    @IBAction func redSliderAction() {
        redValueLabel.text = String(format: "%.02f", redSlider.value)
    }
    
    @IBAction func greenSliderAction() {
        greenValueLabel.text = String(format: "%.02f", greenSlider.value)
    }
    
    @IBAction func blueSliderAction() {
        blueValueLabel.text = String(format: "%.02f", blueSlider.value)
    }
    
    private func setupViews() {
        colorizedView.layer.cornerRadius = 10
        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.value = 0
        redSlider.minimumTrackTintColor = .red
        redSlider.maximumTrackTintColor = UIColor(
            red: 255,
            green: 0,
            blue: 0,
            alpha: 0.3)
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.value = 0
        greenSlider.minimumTrackTintColor = .green
        greenSlider.maximumTrackTintColor = UIColor(
            red: 0,
            green: 255,
            blue: 0,
            alpha: 0.3)
        
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.value = 0
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.maximumTrackTintColor = UIColor(
            red: 0,
            green: 0,
            blue: 255,
            alpha: 0.3)
    }
}

