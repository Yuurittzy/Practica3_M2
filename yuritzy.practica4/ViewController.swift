//
//  ViewController.swift
//  yuritzy.practica4
//
//  Created by Yu on 13/04/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    var scrollview = UIScrollView()

    var name: UILabel!
    var ingredients: UILabel!
    var directions: UILabel!
    var image: UIImageView!
    var btnBack: UIButton!
  
    var bebida: Drinks?
      
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        name.text = bebida?.name
        let bebidaIngredints: String = (bebida?.ingredients)!
        let bebidaDirections: String = (bebida?.directions)!
        let bebidaImagen: String = (bebida?.image)!
        ingredients.text =  "Ingredientes: \(bebidaIngredints)"
        directions.text =  "Instrucciones: \(bebidaDirections)"
        image.image = UIImage(named: bebidaImagen)
    }

    override func viewDidLoad() {
      super.viewDidLoad()
     

        
      name = UILabel()
      name.text="Nombre"
      name.font=UIFont.systemFont(ofSize: 24)
      name.autoresizingMask = .flexibleWidth
      name.translatesAutoresizingMaskIntoConstraints=true
      name.frame=CGRect(x:0, y:30, width: self.view.bounds.width / 2, height: 50)
        
      self.view.addSubview(name)
        
        ingredients = UILabel()
        ingredients.text="Tipo"
        ingredients.autoresizingMask = .flexibleWidth
        ingredients.translatesAutoresizingMaskIntoConstraints=true
        ingredients.frame=CGRect(x:0, y:300, width:self.view.bounds.width, height: 50)
        self.view.addSubview(ingredients)
        
      directions = UILabel()
      directions.text="Tipo"
      directions.autoresizingMask = .flexibleWidth
      directions.translatesAutoresizingMaskIntoConstraints=true
      directions.frame=CGRect(x:0, y:360, width:self.view.bounds.width, height: 50)
      self.view.addSubview(directions)
        
      
      image = UIImageView()
      image.backgroundColor = .lightGray
      image.autoresizingMask = [.flexibleWidth, .flexibleWidth]
      image.frame=CGRect(x:0, y:90, width:200, height:200)
      self.view.addSubview(image)
      
      btnBack = UIButton(type: .system)
      btnBack.setTitle("back", for: .normal)
      btnBack.autoresizingMask = .flexibleWidth
      btnBack.translatesAutoresizingMaskIntoConstraints=true
      btnBack.frame=CGRect(x:0, y:450, width: 100, height: 40)
      btnBack.center = self.view.center
      self.view.addSubview(btnBack)
      btnBack.addTarget(self, action: #selector(self.back(_:)), for:.touchUpInside)
    }
    
    @objc func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


}

