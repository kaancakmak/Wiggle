//
//  MenuVC.swift
//  Wiggle
//
//  Created by Kaan Cakmak on 10.11.2017.
//  Copyright © 2017 Kaan Cakmak. All rights reserved.
//

import UIKit

class MenuVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var menuSections = [MenuSection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let section1 = MenuSection(sectionTitle: "Modules")
        let section2 = MenuSection(sectionTitle: "Clock & Date")
        let section3 = MenuSection(sectionTitle: "Logs")
        let section4 = MenuSection(sectionTitle: "Settings")
        let section5 = MenuSection(sectionTitle: "Credits")
        
        menuSections.append(section1)
        menuSections.append(section2)
        menuSections.append(section3)
        menuSections.append(section4)
        menuSections.append(section5)
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as? MenuCell{
            
            let menuSection = menuSections[indexPath.row]
            cell.updateUI(menuSection: menuSection)
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuSections.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let menuSection = menuSections[indexPath.row]
        let selected = menuSection.sectionTitle
        
        switch selected{
            
        case "Modules": performSegue(withIdentifier: "ModulesVC", sender: menuSection)
        
        case "Clock & Date": performSegue(withIdentifier: "DateVC", sender: menuSection)
            
        case "Logs": performSegue(withIdentifier: "LogsVC", sender: menuSection)
            
        case "Settings": performSegue(withIdentifier: "SettingsVC", sender: menuSection)
            
        case "Credits": performSegue(withIdentifier: "CreditsVC", sender: menuSection)
            
        default: performSegue(withIdentifier: "CreditsVC", sender: menuSection)
        }
    }


}
