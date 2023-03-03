//
//  MoveTableCustomCell.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-03-03.
//

import UIKit

class MoveTableCustomCell: UITableViewCell {
    
    @IBOutlet weak var moveView: UIView!
    @IBOutlet weak var move: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
