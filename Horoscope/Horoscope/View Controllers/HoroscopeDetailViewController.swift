//
//  HoroscopeDetailViewController.swift
//  Horoscope
//
//  Created by Ian Bailey on 1/13/20.
//  Copyright © 2020 Ian Bailey. All rights reserved.
//

import UIKit

class HoroscopeDetailViewController: UIViewController {

    @IBOutlet weak var horoscope: UITextView!
    
    
    
    var horoscopes: Horoscope!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        horoscope.text = horoscopes.horoscope
        
    }
    

    

}
