//
//  SecondViewController.swift
//  animationHomeWork
//
//  Created by Тимур Миргалиев on 07.04.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var slider: UISlider!
    
    
    
    var animator: UIViewPropertyAnimator!

    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func didSlide(_ sender: Any) {
        animator.fractionComplete = CGFloat(slider.value) / 100
    }
    
    func config() {
        animator = UIViewPropertyAnimator(duration: 5.0, curve: .easeInOut, animations: {
            self.secondView.transform = CGAffineTransform(rotationAngle: .pi / 2)
            self.secondView.backgroundColor = .systemGreen
            self.secondView.layer.cornerRadius = 15
        })
    }
}
