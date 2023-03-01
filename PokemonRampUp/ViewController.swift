//
//  ViewController.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pokemonView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    
    private let amountOfPokemon = 5
    private var pokemons: [Pokemon]?
    private let webServices = WebServices()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonView.delegate = self
        pokemonView.dataSource = self
        pokemons = []
        fetchPokemon()
    }
    
    func fetchPokemon() {
        Task {
            do {
                var count = 0;
                while (count < amountOfPokemon){
                    self.pokemons?.append(try await webServices.fetchRandomPokemon())
                    count += 1
                }
                pokemonView.reloadData()
                loadingView.isHidden = true
            }
            catch {
                print("Error while requesting to handle Pokemons")
                loadingView.isHidden = true
                let alert = UIAlertController(title: "Error Loading Pokémon", message: "Please try again or exist app", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: NSLocalizedString("Retry", comment: "This will retry to get Pokémon data"), style: .default, handler: { _ in
                    self.loadingView.isHidden = false
                    self.fetchPokemon()
                    return
                }))

               self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pokemonView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell") as! CustomCell

        if (pokemons?.count ?? 0 == amountOfPokemon){
            let pokemon = pokemons?[indexPath.row]
            cell.pokemonName.text = pokemon?.name
            cell.pokemonType.text = pokemon?.elementTypes[0].name
            cell.pokemonImage.image = pokemon?.images.frontDefault
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //action to go to details page - call the presentation of the details page. Instatite the detailsviewcontroller
    }
    
}

