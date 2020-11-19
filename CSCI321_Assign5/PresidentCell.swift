//
//  CharacterCell.swift
//  CSCI321_assign5
//
//  Created by Rutvik Patel (Z1865128).
//  Created by Aviraj Parmar (Z1861160).
//

import UIKit

    /**
    A coco touch class which deal with custom Table view cell with Image view, Name label and a Political party label
    */
class PresidentCell: UITableViewCell {

    // image view outlet
    @IBOutlet weak var characterImageView: UIImageView!
    
    // President Name Label
    @IBOutlet weak var nameLabel: UILabel!
    
    // Political Party label
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
