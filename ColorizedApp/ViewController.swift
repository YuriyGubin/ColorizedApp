//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Yuriy on 23.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSliders()
    }

    private func setupSliders() {
        redSlider.frame.size.height = 2
    }

}

