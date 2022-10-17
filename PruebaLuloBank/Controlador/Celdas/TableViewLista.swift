//
//  TableViewLista.swift
//  PruebaLuloBank
//
//  Created by Andres Hidalgo on 14/10/22.
//

import UIKit
import Kingfisher

class TableViewLista: UITableViewCell {
    

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var textLulo: UILabel!
    
    
    var datosPokemon: Estructura!
    var vc: ViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCell(pokemon: Estructura, vc: ViewController){
        resetLista()
        
        self.datosPokemon = pokemon
        self.vc = vc
        textLulo.text = pokemon.name?.capitalized
        descargarimagen()
    }
    
    func descargarimagen(){
        
        guard let url = datosPokemon?.image else {
            imagen.image = UIImage(named: "logo")
                    return
        }
        imagen.image = datosPokemon?.image
    }
    
    func resetLista(){
        
        imagen.image = nil
        textLulo.text = ""
        
    }
}
