//
//  AppDelegate.swift
//  yuritzy.practica4
//
//  Created by Yu on 13/04/22.
//

import UIKit
import CoreData
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var plist = [[String:String]]()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        let ud = UserDefaults.standard
        let bandera = (ud.value(forKey: "infoOK") as? Bool) ?? false
        if !bandera {
            obtenerDrinks()
        }
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack
    
    func obtenerDrinks() {
        // encuentra la ubicación en tiempo de ejecución de un archivo agregado al proyecto
        if let archivo = Bundle.main.url(forResource: "Drinks", withExtension: "plist") {
            do {
                let bytes = try Data(contentsOf: archivo)
                let tmp = try PropertyListSerialization.propertyList(from: bytes, options: .mutableContainers, format:nil)
                plist = tmp as! [[String:String]]
               
                print(plist)
                llenaBD(plist, entidad:"Drinks")
               // let ud = UserDefaults.standard
                //ud.set(true, forKey: "infoOK")
                //ud.synchronize()
                
            }
            catch { // manejar el error
                print ("no se pudo obtener la info desde el feed de personas \(error.localizedDescription)")
            }
        }
    }
    
    func llenaBD(_ arreglo:[[String:String]], entidad:String) {
        // 0. Requerimos la descripción de la entidad para poder crear objetos CD
        guard let entidadDesc = NSEntityDescription.entity(forEntityName:entidad, in:persistentContainer.viewContext)
        else {
            return
        }
        for dict in arreglo {
            if entidad == "Drinks" {
                let m = NSManagedObject(entity: entidadDesc, insertInto: persistentContainer.viewContext) as! Drinks
                // 2. setear las properties del objeto, con los datos del dict
                m.inicializaCon(dict)
            }
            saveContext()   // 3. salvar el objeto
        }
    }
 
    func todosLosDrinks() -> [Drinks] {
        print("entro a todas los drinks")
        var resultset = [Drinks]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Drinks")
        do {
            let tmp = try persistentContainer.viewContext.fetch(request)
            resultset = tmp as! [Drinks]
            print(resultset)
        }
        catch {
            print ("fallo el request \(error.localizedDescription)")
        }
        return resultset
    }
    
    
    
    

    lazy var persistentContainer: NSPersistentContainer = {
      
        let container = NSPersistentContainer(name: "yuritzy_practica4")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

