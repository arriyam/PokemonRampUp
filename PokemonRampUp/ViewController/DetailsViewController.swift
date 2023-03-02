//
//  DetailsViewController.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-03-02.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    var pokemon: Pokemon!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = pokemon.images.frontDefault
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        nameLabel.text = pokemon.name
        typeLabel.text = pokemon.elementTypes[0].name

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
