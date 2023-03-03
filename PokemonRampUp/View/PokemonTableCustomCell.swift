//
//  CustomCell.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-03-01.
//
import UIKit

class PokemonTableCustomCell: UITableViewCell {

    @IBOutlet weak var pokemonView: UIView!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
