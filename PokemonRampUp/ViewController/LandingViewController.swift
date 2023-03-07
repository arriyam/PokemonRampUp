//
//  LandingViewController.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-09.
//
import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    
    private let amountOfPokemon = 5
    private var currentPokemonIndex = 0
    private var pokemons: [Pokemon]?
    private let webServices = WebServices()
    private let refreshControl = UIRefreshControl()
    private var alertFactory: AlertFactoryService = AlertImplementation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        alertFactory.delegate = self 
        refreshControl.addTarget(self, action: #selector(refetchPokemon), for: .valueChanged)
        tableView.refreshControl = refreshControl
        pokemons = []
        fetchPokemon()
        
    }
    
    private func fetchPokemon() {
        Task {
            do {
                var count = 0;
                while (count < amountOfPokemon){
                    self.pokemons?.append(try await webServices.fetchRandomPokemon())
                    count += 1
                }
                self.refreshControl.endRefreshing()
                tableView.reloadData()
                loadingView.isHidden = true
            }
            catch {
                loadingView.isHidden = true
                displayAlert()
            }
        }
    }
    
    @objc private func refetchPokemon() {
        pokemons?.removeAll()
        fetchPokemon()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "landingToDetailsPage"{
            let detailsViewController = segue.destination as? DetailsViewController
            detailsViewController?.pokemon = pokemons![currentPokemonIndex]
        }
    }
    
    func displayAlert() {
      let alertData = AlertViewModel(title: "Error Loading Pokémon",
                              message: "Please try again or exist app",
                              style: .alert,
                              enableOkAction: true,
                              okActionTitle: "Retry",
                              okActionStyle: .default,
                              enableCancelAction: false,
                              cancelActionTitle: "")
      
      let alert = alertFactory.build(alertData: alertData)
      present(alert, animated: true, completion: nil)
    }
}


extension LandingViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell") as! CustomCell

        if (pokemons?.count ?? 0 == amountOfPokemon){
            let pokemon = pokemons?[indexPath.row]
            cell.pokemonName.text = pokemon?.name
            cell.pokemonType.text = pokemon?.elementTypes[0].name
            cell.pokemonImage.image = pokemon?.images.frontDefault
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currentPokemonIndex = indexPath.row
        performSegue(withIdentifier: "landingToDetailsPage", sender: self)
    }
    
}

extension LandingViewController: AlertActionDelegate {
  func actionOne() {
      self.refreshControl.endRefreshing()
      self.loadingView.isHidden = false
      self.fetchPokemon()
  }
  func actionTwo() {
     print("ActionTwo called")
  }
}
