
//
//  BluetoothManager.swift
//  Breather
//
//  Created by 강수진 on 28/06/2019.
//  Copyright © 2019 강수진. All rights reserved.
//

import Foundation
import CoreBluetooth

class BluetoothManager: NSObject {
    // MARK: - Properties
    
    var blueEar: BlueEar?
    var isBleConnected : Bool?
    var centralManager: CBCentralManager?
    var discoveredPeripheral: CBPeripheral?
    // MARK: - Initializers
    convenience init (delegate: BlueEar) {
        self.init()
        self.blueEar = delegate
        self.isBleConnected = false
        self.centralManager = CBCentralManager(delegate: self, queue: nil, options: nil)

    }
    
    // MARK: - Functions
    func scan() {
        self.centralManager?.scanForPeripherals(withServices: nil)
        self.blueEar?.didStartScanning()
    }
    
    func disConnect(){
        //todo - 여기서 connection 끊는 작업..?
        self.isBleConnected = false
        self.blueEar?.didDisconnectPeripheral(name: self.discoveredPeripheral?.name)
    }
}

// MARK: - CBCentralManagerDelegate
extension BluetoothManager: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("\ncentralManagerDidUpdateState \(Date())")
        if central.state == .poweredOn {
            self.centralManager?.scanForPeripherals(withServices: nil)
            self.blueEar?.didStartScanning()
        } else {
            self.disConnect()
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        self.discoveredPeripheral = peripheral
        print("\ndidDiscover:", self.discoveredPeripheral?.name ?? "")
        guard let discoveredPeripheral: CBPeripheral = self.discoveredPeripheral else { return }
        self.centralManager?.connect(discoveredPeripheral, options: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("\ndidConnect", peripheral.name ?? "")
        
        self.centralManager?.stopScan()
        if isBleConnected ?? false{
            return
        }
        self.discoveredPeripheral = peripheral
        self.isBleConnected = true
        self.blueEar?.didConnectPeripheral(name: peripheral.name ?? "")
    }

    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("\ndidFailToConnect. Retry")
        self.centralManager?.scanForPeripherals(withServices: nil)
    }

}

