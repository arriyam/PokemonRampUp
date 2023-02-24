//
//  CustomCell.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-24.
//

import UIKit

class CustomCell: UITableViewCell {

    
    @IBOutlet weak var pokemonView: UIView!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
