//
//  ActivityTableViewCell.swift
//  BabyTrack
//
//  Created by Test on 7/23/20.
//  Copyright © 2020 BennyTest. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleheader: UILabel!
    @IBOutlet weak var activity_image: UIImageView!
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var resultColor: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        activity_image.image = UIImage(named: "diaper")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10))
        contentView.layer.cornerRadius = 5.0
        contentView.layer.masksToBounds = true
    }
    
}
