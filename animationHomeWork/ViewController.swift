//
//  ViewController.swift
//  animationHomeWork
//
//  Created by Тимур Миргалиев on 07.04.2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - UI
    @IBOutlet weak var firstView: UIView!

    //MARK: - Properties
    var tapGesture: UITapGestureRecognizer!
    var customAnimator: Animator?
    var selectedCellImageViewSnapshot: UIView?
    
    //MARK: - UI View Life cyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        firstView.layer.cornerRadius = firstView.frame.height / 2
        config()
    }

    func config() {
        tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(didTap))
        self.firstView.addGestureRecognizer(tapGesture)
        (firstView as? Cell)!.configure(image: UIImage(named: "10") ?? UIImage(), title: "Hellow")
    }
    
    @objc
    @IBAction func didTap() {
        UIView.transition(with: firstView, duration: 1, options: .transitionCrossDissolve, animations: { [weak self] in
            self?.firstView.alpha = 1
        }, completion: nil)
        startPresent()
    }
    
    func startPresent() {
        let lampControlSB = UIStoryboard(name: "Main", bundle: nil)
        let lampControlVC = lampControlSB.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        let selectedCell = firstView as? Cell
        
      selectedCellImageViewSnapshot = selectedCell?.mainImage.snapshotView(afterScreenUpdates: false)
        
        lampControlVC.transitioningDelegate = self
        
        lampControlVC.modalPresentationStyle = .fullScreen
        present(lampControlVC, animated: true)
        
    }
}

//MARK: - UIViewControllerTransitioningDelegate
extension ViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let menuVC = presenting as? ViewController,
              let lampControlVC = presented as? SecondViewController,
              let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
        else { return nil }
        
        customAnimator = Animator(type: .present, menuViewController: menuVC, lampControlViewController: lampControlVC, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return customAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let lampControlVC = dismissed as? SecondViewController,
              let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
        else { return nil }
        
        customAnimator = Animator(type: .dismiss, menuViewController: self, lampControlViewController: lampControlVC, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return customAnimator
    }
}
