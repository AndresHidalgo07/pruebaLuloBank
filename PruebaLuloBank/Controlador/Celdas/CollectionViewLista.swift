//
//  CollectionViewLista.swift
//  PruebaLuloBank
//
//  Created by Andres Hidalgo on 16/10/22.
//

import Foundation
import UIKit
import Kingfisher

class CollectionViewLista: UICollectionViewCell{
    
    @IBOutlet weak var collectionlabel: UILabel!
    @IBOutlet weak var collectionImage: UIImageView!

    var datosPokemon: Estructura!
    var vc: ViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(pokemon: Estructura, vc: ViewController){
        resetLista()
        
        self.datosPokemon = pokemon
        self.vc = vc
        collectionlabel.text = pokemon.name?.capitalized
        descargarimagen()
    }
    
    func descargarimagen(){
        
        guard let url = datosPokemon?.image else {
            collectionImage.image = UIImage(named: "logo")
                    return
        }
        collectionImage.image = datosPokemon?.image
    }
    
    func resetLista(){
        
        collectionImage.image = nil
        collectionlabel.text = ""
        
    }
}
