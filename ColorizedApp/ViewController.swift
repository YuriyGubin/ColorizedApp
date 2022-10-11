//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Yuriy on 23.09.2022.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets
    
    @IBOutlet var colorizedView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
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
    
    // MARK: - methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorizedView.layer.cornerRadius = 15
        
        colorizedView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    
    // MARK: - IBActions
    
    @IBAction func slidersAction(_ sender: UISlider) {
        colorizedView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        redValueLabel.text = String(format: "%.02f", redSlider.value)
        greenValueLabel.text = String(format: "%.02f", greenSlider.value)
        blueValueLabel.text = String(format: "%.02f", blueSlider.value)
    }
}

