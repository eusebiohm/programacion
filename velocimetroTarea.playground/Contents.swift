//: Playground - noun: a place where people can play

import UIKit

// enumerado que contiene las velocidades que se mostrarán.
enum Velocidades: Int, CustomStringConvertible {
    case Apagado = 0
    case VelocidadBaja = 20
    case VelocidadMedia = 50
    case VelocidadAlta = 120
    
    // inicializador para dar valor inicial al enumerado.
    init(velocidadInicial: Velocidades) {
        self = velocidadInicial
    }
    
    // propiedad computada que devuelve el valor impreso de la velocidad actual.
    var description: String {
        switch self {
        case .Apagado:
            return "Apagado"
        case .VelocidadBaja:
            return "Velocidad Baja"
        case .VelocidadMedia:
            return "Velocidad Media"
        case .VelocidadAlta:
            return "Velocidad Alta"
        }
    }
}

// clase que modela el comportamiento de nuestro Velocimetro digital.
class Auto {
    var velocidad: Velocidades
    var subiendo = true
    
    /**
     Inicializador para la clase, que establece el valor incial default de velocidad.
     */
    init() {
        self.velocidad = .Apagado
    }
    
    /**
     Funcion que permite variar la velocidad actual, además de devolver su valor.
     */
    func cambioDeVelocidad() -> (actual: Int, velocidadEnCadena: String) {
        // guardamos temporalmente el valor de velocidad actual.
        let velocidadActual = self.velocidad
        
        // hacemos el cambio de velocidad subiendo.
        if subiendo {
            if self.velocidad == .Apagado {
                self.velocidad = .VelocidadBaja
            } else if self.velocidad == .VelocidadBaja {
                self.velocidad = .VelocidadMedia
            } else if self.velocidad == .VelocidadMedia {
                self.velocidad = .VelocidadAlta
            } else {
                self.subiendo = false
                self.velocidad = .VelocidadMedia
            }
        }
            
            // hacemos el cambio de velocidad bajando.
        else {
            if self.velocidad == .VelocidadAlta {
                self.velocidad = .VelocidadMedia
            } else if self.velocidad == .VelocidadMedia {
                self.velocidad = .VelocidadBaja
            } else if self.velocidad == .VelocidadBaja {
                self.velocidad = .Apagado
            } else {
                self.subiendo = true
                self.velocidad = .VelocidadBaja
            }
        }
        
        print(velocidadActual.description)
        
        // devolver el valor de la velocidad actual
        return (velocidadActual.rawValue, velocidadActual.description)
    }
    
}

// creamos instancia de un nuevo Velocimetro.
var auto = Auto()

// simular cambio de velocidad 20 veces
for var i = 1; i <= 20 ; i++ {
    auto.cambioDeVelocidad()
}
