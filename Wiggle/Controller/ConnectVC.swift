//
//  ConnectVC.swift
//  Wiggle
//
//  Created by Kaan Cakmak on 15.12.2017.
//  Copyright © 2017 Kaan Cakmak. All rights reserved.
//

import Foundation
import CoreBluetooth
import UIKit

class ConnectVC: UIViewController, UITableViewDataSource, UITableViewDelegate, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var testLabel: UILabel!
    
    var manager: CBCentralManager!
    
    let scanningDelay = 1.0
    
    var items = [String: [String: Any]]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
   
        
        // Do any additional setup after loading the view, typically from a nib.
        manager = CBCentralManager(delegate: self, queue: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell{
            
            let item = itemForIndexPath(indexPath)
            
            let itemName = item!["name"] as! String
            
            cell.updateName(_firstLabel: itemName)
            
            testLabel.text = "1"
            
            if let rssi = item!["rssi"] as? Int {
                let itemRSSI = "\(rssi.description) dBm"
                cell.updateRSSI(_secondLabel: itemRSSI)
                testLabel.text = "2"
            } else {
                cell.updateRSSI(_secondLabel: "Unknown")
                testLabel.text = "3"
            }
            return cell
        }
        else{
            testLabel.text = "4"
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.keys.count
    }
    
    func itemForIndexPath(_ indexPath: IndexPath) -> [String: Any]?{
        
        if indexPath.row > items.keys.count{
            return nil
        }
        
        return Array(items.values)[indexPath.row]
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager){
        if central.state == .poweredOn{
            manager.scanForPeripherals(withServices: nil, options: nil)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didReadRSSI RSSI: NSNumber, error: Error?) {
        
        didReadPeripheral(peripheral, rssi: RSSI)
        
        delay(scanningDelay){
            peripheral.readRSSI()
        }
    }
    
    func didReadPeripheral(_ peripheral: CBPeripheral, rssi: NSNumber){
        
        if let name = peripheral.name{
            
            items[name] = [
                "name":name,
                "rssi":rssi
            ]
        }
        tableView.reloadData()
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral){
        peripheral.readRSSI()
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
}
