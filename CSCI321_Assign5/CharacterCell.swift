//
//  CharacterCell.swift
//  CSCI321_Assign5
//
//  Created by Aviraj Parmar on 11/19/20.
//  Copyright © 2020 Aviraj. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {

    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
