//
//  Networking.swift
//  PruebaLuloBank
//
//  Created by Andres Hidalgo on 14/10/22.
//

import Foundation
import Alamofire

class Networking{
    
    static let compartir = Networking()
    private init(){}
    
    func consultarPokemones( completar: @escaping(Any)->Void){
        
        var url = APIs.pokemones
        url = Util.codificarUrl(url: url)
        print(url)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = HTTPMethod.get.rawValue
        
        Alamofire.request(request).responseJSON { (response) in
            completar(response)
            print(response)
        }
    }
}


