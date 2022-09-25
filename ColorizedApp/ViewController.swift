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
        redValueLabel.text = "\(round(redSlider.value * 100) / 100)"
    }
    
    @IBAction func greenSliderAction() {
        greenValueLabel.text = "\(round(greenSlider.value * 100) / 100)"
    }
    
    
    @IBAction func blueSliderAction() {
        blueValueLabel.text = "\(round(blueSlider.value * 100) / 100)"
    }
    
    private func setupViews() {
        colorizedView.layer.cornerRadius = 10
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        
        blueSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        
        
    }

}

