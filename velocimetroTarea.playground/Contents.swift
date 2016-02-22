//: Playground - noun: a place where people can play
// version del 22 febrero de 2016
// Eusebio Hernandez
import UIKit

// enumerado que contiene las velocidades que se mostrarán.
enum Velocidades: Int {
    case Apagado = 0
    case VelocidadBaja = 20
    case VelocidadMedia = 50
    case VelocidadAlta = 120
    init(velocidadInicial: Velocidades) {
        self = velocidadInicial
         }
    }
    
   
// clase que modela el comportamiento de nuestro Velocimetro digital.
    class Auto {
        var velocidad : Velocidades
        init () {
            self.velocidad = Velocidades(velocidadInicial: .Apagado)
        }
        
        func cambioDeVelocidad() -> (actual: Int, VelocidadEnCadena : String){
            var resultado : (Int, String)
            resultado.0 = velocidad.rawValue
            
            switch velocidad {
            case .Apagado:
                    resultado.1 = "Apagado"
                self.velocidad = .VelocidadBaja
            case .VelocidadBaja:
                resultado.1 = "Velocidad Baja"
                self.velocidad = .VelocidadMedia
            case .VelocidadMedia:
                resultado.1 = "Velocidad Media"
                
                self.velocidad = .VelocidadAlta
            case .VelocidadAlta:
                resultado.1 = "Velocidad alta"
                self.velocidad = .VelocidadMedia
                
                
            }
         return (resultado)
            
   
        }
        
}
var auto = Auto()
for i in 0...19 {
    print("\(auto.cambioDeVelocidad())")
    
}





