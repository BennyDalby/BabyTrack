//
//  OptionCollectionViewCell.swift
//  BabyTrack
//
//  Created by Test on 7/24/20.
//  Copyright © 2020 BennyTest. All rights reserved.
//

import UIKit

class OptionCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = .clear
    }

}
