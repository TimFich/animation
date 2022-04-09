//
//  Cell.swift
//  animationHomeWork
//
//  Created by Тимур Миргалиев on 07.04.2022.
//

import Foundation
import UIKit

class Cell: UIView {
    
    //MARK: - UI
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainTitle: UILabel!
    
    //MARK: - Configure cell
    func configure(image: UIImage, title: String) {
        mainTitle.text = title
        mainImage.image = image
    }
}
