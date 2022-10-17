//
//  ViewController.swift
//  PruebaLuloBank
//
//  Created by Andres Hidalgo on 14/10/22.
//

import UIKit
import Alamofire
import Foundation
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var estadoView: UISegmentedControl!
    @IBOutlet weak var tableViewLulo: UITableView!
    @IBOutlet weak var collectionViewLulo: UICollectionView!
    
    var datosPokemon = [Estructura]()

    override func viewDidLoad() {
        super.viewDidLoad()
        buscarPokemon()
        collectionViewLulo.isHidden = true
    }
    @IBAction func estadoViewClick(_ sender: Any) {
        switch estadoView.selectedSegmentIndex {
        case 0:
            tableViewLulo.isHidden = false
            collectionViewLulo.isHidden = true
        case 1 :
            tableViewLulo.isHidden = true
            collectionViewLulo.isHidden = false
        default:
            break
        }
    }
    
    func buscarPokemon() {
        Service.shared.fetchPokemonData{ (poke) in
            DispatchQueue.main.async {
                self.datosPokemon  = poke
                self.initTableView()
                self.initCollectionView()
            }
        }
    }
    
    func initTableView (){
        
        tableViewLulo.delegate = self
        tableViewLulo.dataSource = self
        tableViewLulo.reloadData()
    }
    
    func initCollectionView(){
        collectionViewLulo.delegate = self
        collectionViewLulo.dataSource = self
        collectionViewLulo.reloadData()
    }

    func abrirDetalleTable(detalle: Estructura){
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetalleViewController") as! DetalleViewController
        vc.modalPresentationStyle = .fullScreen
        vc.detalle = detalle
        self.present(vc, animated: true, completion: nil)
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datosPokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewLista", for: indexPath ) as! TableViewLista
        
        cell.setCell(pokemon: datosPokemon[indexPath.row], vc: self)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        abrirDetalleTable(detalle: datosPokemon[indexPath.row])
    }
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datosPokemon.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewLista", for: indexPath) as! CollectionViewLista
        
        cell.setCell(pokemon: datosPokemon[indexPath.row], vc: self)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        abrirDetalleTable(detalle: datosPokemon[indexPath.row])
    }
}
