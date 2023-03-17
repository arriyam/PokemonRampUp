//
//  DetailsViewController.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-03-07.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var moveTableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!

    var pokemon: Pokemon!
    var pokemonMoves: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = pokemon.images.frontDefault
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        nameLabel.text = pokemon.name
        typeLabel.text = pokemon.elementTypes[0].name
        
        moveTableView.delegate = self
        moveTableView.dataSource = self
        setPokemonMoveList()
    }
    
    func setPokemonMoveList(){
        self.pokemonMoves = []
        self.pokemonMoves = pokemon.moves.compactMap { $0.name }
        moveTableView.reloadData()
    }
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonMoves?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonMoveCell") as! MoveTableCustomCell

        if (pokemonMoves?.count != nil){
            let name = pokemonMoves?[indexPath.row]
            cell.move.text = name
        }
        cell.selectionStyle = .none
        return cell
    }
}
