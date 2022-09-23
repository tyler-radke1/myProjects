//
//  ViewController.swift
//  Ryans Pokemon App
//
//  Created by Tyler Radke on 9/21/22.
//

import UIKit
import RyansPokemonPackage

class ViewController: UIViewController {
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    @IBOutlet weak var typesStackView: UIStackView!
    
    @IBOutlet weak var newPokemonButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newPokemonButton.layer.cornerRadius = newPokemonButton.frame.height / 2
        
    }

    @IBAction func newPokemonButtonTap(_ sender: Any) {
        Task {
            let pokemon = await  getRandomPokemon()
            pokemonNameLabel.text = pokemon.name
            pokemonImageView.setPokemon(pokemon: pokemon)
            
            for view in typesStackView.arrangedSubviews {
                view.removeFromSuperview()
            }
            for pType in pokemon.types {
                let label = UILabel()
                label.text = pType
                typesStackView.addArrangedSubview(label)
            }
        }
        
        
        
    }
    
}

