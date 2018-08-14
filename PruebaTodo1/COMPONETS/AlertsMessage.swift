//
//  PruebaTodo1Tests.swift
//  PruebaTodo1
//
//  Created by Pedro Alonso Daza B on 12/08/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import UIKit

func showAlertError(View: UIViewController, Men: String)
{
    let alertController = UIAlertController(title: "Información", message:
        Men, preferredStyle: UIAlertControllerStyle.alert)
    alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,handler: nil))
    
    View.present(alertController, animated: true, completion: nil)
}
