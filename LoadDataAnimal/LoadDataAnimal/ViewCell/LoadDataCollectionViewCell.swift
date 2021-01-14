//
//  LoadDataCollectionViewCell.swift
//  LoadDataAnimal
//
//  Created by Dai Huynh on 12/24/20.
//

import UIKit

class LoadDataCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var animalView: UIView!
    @IBOutlet weak var animalImageView: ImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblWeigh: UILabel!
    @IBOutlet weak var lblSpeed: UILabel!
    @IBOutlet weak var lblOld: UILabel!
    @IBOutlet weak var lblFood: UILabel!
    
    
    override func layoutSubviews() {
        
        animalView.layer.cornerRadius = animalView.frame.height / 22
        animalView.clipsToBounds = true
        animalImageView.layer.cornerRadius = animalImageView.frame.height / 2
        animalImageView.clipsToBounds = true
        animalImageView.contentMode = .scaleAspectFill
        animalImageView.layer.borderWidth = 2
        animalImageView.layer.borderColor = UIColor.white.cgColor
        
 
    }
}

