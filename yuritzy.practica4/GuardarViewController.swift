//
//  GuardarViewController.swift
//  yuritzy.practica4
//
//  Created by Yu on 13/04/22.
//

import UIKit
import CoreData

class GuardarViewController: UIViewController {
    
    var datos = [Drinks]()

    @IBOutlet weak var nameBebida: UITextField!
    @IBOutlet weak var ingredientsBebida: UITextField!
    @IBOutlet weak var directionsBebida: UITextView!
    
    @IBAction func Guardar(_ sender: Any) {
        
        let name_Bebida = nameBebida.text!
        let directions_Bebida = directionsBebida.text!
        let ingredients_Bebida = ingredientsBebida.text!
       
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //let appTableViewController = UIApplication.shared.delegate as! BebidaTableViewController
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Drinks", in: context)
        let newdrink = Drinks(entity: entity!, insertInto: context)
        newdrink.name = name_Bebida
        newdrink.directions = directions_Bebida
        newdrink.ingredients = ingredients_Bebida
        newdrink.image = "drink.jpg"
        
        do{
            try context.save()
           
            print("Registro Guardado!!")
        }
        catch{
            print("No se guardo el registro")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
