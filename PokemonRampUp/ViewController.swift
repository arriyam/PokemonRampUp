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
    
    var pokemons: [Pokemon]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonView.delegate = self
        pokemonView.dataSource = self
        fetchPokemon()
        print("hello")
    }
    
//    landing page = Pokemon[] -> details page
    
    
    func fetchPokemon() {
        Task {
            do {
                self.pokemons?.append(try await WebServices().fetchRandomPokemon())
                pokemonView.reloadData()
                loadingView.isHidden = true
            }
            catch {
                print("Error while requesting to handle Pokemons")
                loadingView.isHidden = true
                // do something to handle `UIAlertMessage?`
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

        let pokemon = pokemons?[indexPath.row]
        cell.pokemonName.text = pokemon?.name
        cell.pokemonType.text = pokemon?.elementTypes[0].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //action to go to details page - call the presentation of the details page. Instatite the detailsviewcontroller
    }
    
    func fetchImage(urlString: String) async throws -> UIImage {

        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidURL
        }

        guard let image = UIImage(data: data) else {
            throw NetworkError.invaildImageData
        }

        return image
    }
    
}

