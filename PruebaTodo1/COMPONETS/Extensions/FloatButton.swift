//
//  FloatButton.swift
//  PruebaTodo1
//
//  Created by Pedro Alonso Daza B on 13/08/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import UIKit

class FloatButton:UIButton
{
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = self.frame.width / 2

    }
}
