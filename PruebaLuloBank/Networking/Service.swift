//
//  Service.swift
//  PruebaLuloBank
//
//  Created by Andres Hidalgo on 17/10/22.
//

import Foundation
import PokemonAPI
import UIKit

class Service{
    
    public static let shared = Service()
    
    func fetchPokemonData(completion: @escaping([Estructura]) -> ()){
        var pokemons = [Estructura]()
        for id in 1...30{
            PokemonAPI().pokemonService.fetchPokemon(id) { result in
                switch result {
                case .success(let pokemonRes):
                    
                    let dictionary: [String: AnyObject] = ["name": pokemonRes.name as AnyObject,
                                                     "weight": pokemonRes.weight as AnyObject,
                                                     "height": pokemonRes.height as AnyObject,
                                                     "baseExperience": pokemonRes.baseExperience as AnyObject,
                                                    "imageUrl": pokemonRes.sprites?.frontDefault as AnyObject,
                                                    "backImageUrl": pokemonRes.sprites?.backDefault as AnyObject,
                                                    "type": pokemonRes.types?.first?.type?.name as AnyObject ]
                    let pokemon = Estructura(id: id, dictionary: dictionary)
                    guard let backImageUrl = pokemonRes.sprites?.backDefault else {return}
                    self.fetchImage(withUrlString: backImageUrl) { image in
                        pokemon.backImage = image
                    }
                    guard let imageUrl = pokemonRes.sprites?.frontDefault else {return}
                    self.fetchImage(withUrlString: imageUrl) { image in
                        pokemon.image = image
                        pokemons.append(pokemon)
                        pokemons.sort { pokemon1, pokemon2 in
                            return pokemon1.id! < pokemon2.id!
                        }
                        completion(pokemons)
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
     }
        
}
    
    private func fetchImage(withUrlString urlString: String, completion: @escaping(UIImage)->()){
        
        guard let url  = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error =  error {
                print ("fetchin image error", error.localizedDescription)
                return
            }
            
            guard let data  = data  else {return}
            guard let image = UIImage(data: data) else {return}
            
            completion(image)
        }.resume()
    }
}
