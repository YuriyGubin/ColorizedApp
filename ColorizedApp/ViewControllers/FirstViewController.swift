//
//  FirstViewController.swift
//  ColorizedApp
//
//  Created by Yuriy on 11.10.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setBackgroundColor(with color: UIColor)
}

class FirstViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.viewColor = view.backgroundColor
        settingsVC.delegate = self
    }
}

// MARK: - SettingsViewControllerDelegate
extension FirstViewController: SettingsViewControllerDelegate {
    func setBackgroundColor(with color: UIColor) {
        view.backgroundColor = color
    }
}
