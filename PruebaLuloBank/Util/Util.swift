//
//  Util.swift
//  PruebaLuloBank
//
//  Created by Andres Hidalgo on 15/10/22.
//

import Foundation
import UIKit

public class Util{
    
    public static func codificarUrl(url:String) -> String {
        let safeURL = url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        
        return safeURL
        
    }
}
