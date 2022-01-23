//
//  FriendsTableViewCell.swift
//  vk
//
//  Created by Максим Прокопенко on 23.01.2022.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    static func nib() -> UINib {
        return UINib(nibName: "FriendsTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var labelPerson: UILabel!
    @IBOutlet weak var imagePerson: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
