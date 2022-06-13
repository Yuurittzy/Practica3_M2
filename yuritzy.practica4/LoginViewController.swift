//
//  LoginViewController.swift
//  yuritzy.practica4
//
//  Created by Yu on 12/06/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    var a_i = UIActivityIndicatorView()
    
    
    @IBAction func btnEntrarTouch(_ sender: Any) {
        a_i.startAnimating()
               // Autenticación con Firebase
               Auth.auth().signIn(withEmail: self.txtUser.text!, password: self.txtPass.text!) { (user, error) in
                   if error != nil {
                       let alert = UIAlertController(title: "", message: "Ocurrió un error \(error!.localizedDescription)", preferredStyle: UIAlertController.Style.alert)
                       alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                       DispatchQueue.main.async {
                           self.a_i.stopAnimating()
                           self.present(alert, animated: true, completion: nil)
                       }
                   }
                   else {
                       DispatchQueue.main.async {
                           self.a_i.stopAnimating()
                           self.performSegue(withIdentifier: "goHome", sender: nil)
                       }
                   }
               }
    }
    
    
    
    @IBAction func Registrarse(_ sender: Any) {
        let alert = UIAlertController(title: "Nuevo Usuario", message: "Introduce tus datos", preferredStyle: UIAlertController.Style.alert)
               alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.cancel, handler: nil))
               // Agregar text fields a un alert
               alert.addTextField(configurationHandler:{ txtEmail in
                   txtEmail.placeholder = "Tu email"
               })
               alert.addTextField(configurationHandler:{ txtPass in
                   txtPass.placeholder = "6 caracteres o más"
               })
               let btnEnviar = UIAlertAction(title: "Enviar", style: .default, handler:{ action in
                   guard let email = alert.textFields![0].text,
                   let pass = alert.textFields![1].text
                   else { return }
                   Auth.auth().createUser(withEmail: email, password: pass) { auth, error in
                       if error != nil {
                           print ("ocurrió un error \(error!.localizedDescription)")
                       }
                   }
               })
               alert.addAction(btnEnviar)
               self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
            a_i.style = .large
            a_i.color = .red
            a_i.hidesWhenStopped = true
            a_i.center = self.view.center
            self.view.addSubview(a_i)
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
