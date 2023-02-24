//
//  ViewController.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-02-09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pokemonView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pokemonView.delegate = self
        pokemonView.dataSource = self
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pokemonView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell") as! CustomCell
        
        cell.pokemonName.text = "Hen"
        cell.pokemonType.text = "Bob"
        
        return cell
    }
    
    
}

