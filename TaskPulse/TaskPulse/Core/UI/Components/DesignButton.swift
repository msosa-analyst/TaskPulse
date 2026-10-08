//
//  DesignButton.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 08/10/26.
//

import UIKit

@IBDesignable
class DesignButton: UIButton {
    
    // MARK: - Inspectables para configurar icono desde storyboard
    @IBInspectable var iconSystemName: String = "" {
        didSet {
            setupIconWithConfiguration() // O el nombre que le diste a tu función
        }
    }
    
    // MARK: - Inicializadores
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStyle()
    }
    
    private func setupStyle(){
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0x33/255.0, green: 0x41/255.0, blue: 0x55/255.0, alpha: 1.0).cgColor
    }
    
    private func setupIconWithConfiguration() {
        guard !iconSystemName.isEmpty else { return }
        
        // Si 'configuration' es nil, le asignas una base .plain() sin borrar tu estilo previo
        var config = configuration ?? UIButton.Configuration.plain()
        
        config.image = UIImage(systemName: iconSystemName)
        config.imagePlacement = .trailing // Coloca el ícono a la derecha
        config.imagePadding = 8.0         // Separación entre texto e ícono
        
        config.baseForegroundColor = .white
        
        self.configuration = config
    }
    
}
