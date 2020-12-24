//
//  main.swift
//  SwiftLesson3
//
//  Created by Ниязов Ринат Раимжанович on 12/24/20.
//

import Foundation


enum CarType {
    case city, sport, trunk
}
enum FuelType {
    case electro, petrol, diesel
}
enum WindowsState {
    case open, close
}
enum EngineState {
    case enabled, disabled
}
struct SportCar {
    let carType: CarType
    let yearProd: Int
    let brand: String
    let model: String
    let trunkVolume: Float
    private var filledTrunkVolume: Float
    private var isWindowsOpened: Bool
    private var isEngineRunning: Bool
    
    var engineState: EngineState {
        willSet {
            if newValue == .enabled {
                isEngineRunning = true
                print("Двигатель \(brand)-\(model) включен")
            } else {
                isEngineRunning = false
                print("Двигатель \(brand)-\(model) отключен")
            }
        }
    }
    
    var windowsState: WindowsState {
        willSet {
            if newValue == .open {
                isWindowsOpened = true
                print("Окна \(brand)-\(model) открылись!")
            } else {
                isWindowsOpened = false
                print("Окна \(brand)-\(model) закрылись!")
            }
        }
    }
    
    var cargoLoading: Float {
        willSet {
            if newValue + filledTrunkVolume <= trunkVolume {
                filledTrunkVolume += newValue
                print("\(brand)-\(model): Погружен новый груз объемом \(newValue)кг, осталось \(trunkVolume - filledTrunkVolume)кг ")
            } else {
                print("\(brand)-\(model): Недостаточно места, осталось \(trunkVolume - filledTrunkVolume)кг ")
            }
        }
    }
    
    init(yearProd: Int, brand: String, model: String, trunkVolume: Float) {
        carType = .sport
        self.yearProd = yearProd
        self.brand = brand
        self.model = model
        self.trunkVolume = trunkVolume
        self.filledTrunkVolume = 0
        isWindowsOpened = false
        isEngineRunning = false
        cargoLoading = 0
        windowsState = .close
        engineState = .disabled
    }
    
    mutating func openWindows() {
        if(isWindowsOpened != true) {
            self.windowsState = .open
        } else {
            print("Окна \(brand)-\(model) уже открыты")
        }
        
    }
    mutating func closeWindows() {
        if(isWindowsOpened != false) {
            self.windowsState = .close
        } else {
            print("Окна \(brand)-\(model) уже закрыты")
        }
    }
    
    mutating func enableEngine() {
        if(isEngineRunning != true) {
            self.engineState = .enabled
        } else {
            print("Двигатель \(brand)-\(model) уже запущен")
        }
        
    }
    mutating func disableEngine() {
        if(isEngineRunning != false) {
            self.engineState = .disabled
        } else {
            print("Двигатель \(brand)-\(model) уже отключен")
        }
    }
    
    func trunkVolumeInfo() {
        print("Автомобиль \(brand)-\(model) загружен на \(filledTrunkVolume) кг")
    }
}

struct TrunkCar {
    let carType: CarType
    let yearProd: Int
    let brand: String
    let model: String
    let trunkVolume: Float
    private var filledTrunkVolume: Float
    private var isWindowsOpened: Bool
    private var isEngineRunning: Bool
    
    var engineState: EngineState {
        willSet {
            if newValue == .enabled {
                isEngineRunning = true
                print("Двигатель \(brand)-\(model) включен")
            } else {
                isEngineRunning = false
                print("Двигатель \(brand)-\(model) отключен")
            }
        }
    }
    
    var windowsState: WindowsState {
        willSet {
            if newValue == .open {
                isWindowsOpened = true
                print("Окна \(brand)-\(model) открылись!")
            } else {
                isWindowsOpened = false
                print("Окна \(brand)-\(model) закрылись!")
            }
        }
    }
    
    var cargoLoading: Float {
        willSet {
            if newValue + filledTrunkVolume <= trunkVolume {
                filledTrunkVolume += newValue
                print("\(brand)-\(model): Погружен новый груз объемом \(newValue)кг, осталось \(trunkVolume - filledTrunkVolume)кг ")
            } else {
                print("\(brand)-\(model): Недостаточно места, осталось \(trunkVolume - filledTrunkVolume)кг ")
            }
        }
    }
    
    init(yearProd: Int, brand: String, model: String, trunkVolume: Float) {
        carType = .trunk
        self.yearProd = yearProd
        self.brand = brand
        self.model = model
        self.trunkVolume = trunkVolume
        self.filledTrunkVolume = 0
        isWindowsOpened = false
        isEngineRunning = false
        cargoLoading = 0
        windowsState = .close
        engineState = .disabled
    }
    
    mutating func openWindows() {
        if(isWindowsOpened != true) {
            self.windowsState = .open
        } else {
            print("Окна \(brand)-\(model) уже открыты")
        }
        
    }
    mutating func closeWindows() {
        if(isWindowsOpened != false) {
            self.windowsState = .close
        } else {
            print("Окна \(brand)-\(model) уже закрыты")
        }
    }
    
    mutating func enableEngine() {
        if(isEngineRunning != true) {
            self.engineState = .enabled
        } else {
            print("Двигатель \(brand)-\(model) уже запущен")
        }
        
    }
    mutating func disableEngine() {
        if(isEngineRunning != false) {
            self.engineState = .disabled
        } else {
            print("Двигатель \(brand)-\(model) уже отключен")
        }
    }
    
    func trunkVolumeInfo() {
        print("Грузовик \(brand)-\(model) загружен на \(filledTrunkVolume) кг")
    }
}


var porsche = SportCar(yearProd: 2019, brand: "Porsche", model: "911", trunkVolume: 120)
var astonMartin = SportCar(yearProd: 2012, brand: "Aston Martin", model: "DB9", trunkVolume: 145)

var volkswagen = TrunkCar(yearProd: 2010, brand: "Volkswagen", model: "Tractor Trunk", trunkVolume: 3750)
var man = TrunkCar(yearProd: 2014, brand: "MAN", model: "Titan", trunkVolume: 4200)


porsche.openWindows()
porsche.cargoLoading = 119
porsche.cargoLoading = 3
astonMartin.enableEngine()
astonMartin.cargoLoading = 150
porsche.trunkVolumeInfo()

volkswagen.enableEngine()
man.closeWindows()
man.cargoLoading = 400
man.cargoLoading = 800
man.cargoLoading = 2000
man.cargoLoading = 800
man.trunkVolumeInfo()


print(porsche)
print(astonMartin)
print(volkswagen)
print(man)
