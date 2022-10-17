//
//  DetalleViewController.swift
//  PruebaLuloBank
//
//  Created by Andres Hidalgo on 15/10/22.
//

import UIKit
import Kingfisher

class DetalleViewController: UIViewController {
    
    @IBOutlet weak var imagenDetalle: UIImageView!
    @IBOutlet weak var autorDetalle: UILabel!
    @IBOutlet weak var tituloDetalle: UILabel!
    @IBOutlet weak var pesoDetalle: UILabel!
    @IBOutlet weak var textoDescripcion: UITextView!

    var detalle: Estructura?
    
        override func viewDidLoad() {
            super.viewDidLoad()
            resetValues()
            descargarImagen()
            insertarTexto ()
            
            guard let copy = detalle!.baseExperience else {
                    autorDetalle.text  = "empty"
                        return
            }
            autorDetalle.text  = "Experience: \(copy)"
            
            guard let height = detalle!.height else {
                pesoDetalle.text  = "empty"
                        return
            }
            pesoDetalle.text  = "Height: \(height)"

    }
    
    func insertarTexto (){
        tituloDetalle.text = detalle?.name!
        textoDescripcion.text = detalle?.description
    }
        
        func resetValues(){
            
            imagenDetalle.image = nil
            tituloDetalle.text = ""
            textoDescripcion.text = ""
        }
        
        func descargarImagen(){
            
            guard (detalle?.image) != nil else {
                imagenDetalle.image = UIImage(named: "logo")
                        return
            }
            imagenDetalle.image = detalle?.image
        }
    
        @IBAction func devolver( sender: Any){
            dismiss(animated: true, completion: nil)
        }
    }
