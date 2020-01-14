//
//  HoroscopeViewController.swift
//  Horoscope
//
//  Created by Ian Bailey on 1/14/20.
//  Copyright © 2020 Ian Bailey. All rights reserved.
//

import UIKit
import NetworkHelper

class HoroscopeViewController: UIViewController {

    
    @IBOutlet weak var horoscopeTableVIew: UITableView!
    
    
    var horoscopes = [Horoscope]() {
           didSet {
               DispatchQueue.main.async{
            self.horoscopeTableVIew.reloadData()
               }
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        horoscopeTableVIew.dataSource = self
        getHoroscopes()
       
    }
    
    
    private func getHoroscopes() {
        HoroscopeAPI.getHoroscope { (results) in
            switch results {
            case .success(let data):
                self.horoscopes = data
            case .failure(_):
                print("appError \(AppError.noData)")
            }
        }
    }
    
   

}

extension HoroscopeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "horoscopeCell", for: indexPath)
        let scopes = horoscopes[indexPath.row]
        cell.textLabel?.text = scopes.sunsign
        return cell
    }
    
    
}
