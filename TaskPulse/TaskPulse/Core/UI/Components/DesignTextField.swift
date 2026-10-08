//
//  DesignTextField.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 08/10/26.
//

import UIKit

@IBDesignable
class DesignTextField: UITextField {

    // MARK: - Inspectables para configurar icono desde storyboard
    @IBInspectable var iconSystemName: String = "" {
        didSet {
            setupLeftIcon(named: iconSystemName)
        }
    }
    
    // MARK: - Inspectables para configurar placeholder desde storyboard
    
    @IBInspectable var customPlaceholder: String = "" {
        didSet {
            setCustomPlaceholder(customPlaceholder)
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

    // MARK: - Configuración Visual
    private func setupStyle() {
        borderStyle = .none
        layer.cornerRadius = 12.0
        layer.masksToBounds = true
        
        // Color del borde (#334155)
        layer.borderColor = UIColor(
            red: 0x33/255.0,
            green: 0x41/255.0,
            blue: 0x55/255.0,
            alpha: 1.0
        ).cgColor
        layer.borderWidth = 1.0
        
        // Color de fondo (#161F2E)
        backgroundColor = UIColor(
            red: 0x16/255.0,
            green: 0x1F/255.0,
            blue: 0x2E/255.0,
            alpha: 1.0
        )
        
        // Color de texto
        textColor = .white
    }

    // Método para configurar el placeholder con estilo
    func setCustomPlaceholder(_ text: String) {
        let placeholderColor = UIColor(
            red: 0xE2/255.0,
            green: 0xE8/255.0,
            blue: 0xF0/255.0,
            alpha: 1.0
        )
        attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [.foregroundColor: placeholderColor]
        )
    }

    // Método para inyectar el ícono izquierdo con su padding
    func setupLeftIcon(named systemName: String) {
        guard let iconImage = UIImage(systemName: systemName) else { return }
        
        let iconImageView = UIImageView(image: iconImage)
        iconImageView.tintColor = UIColor(
            red: 0xE2/255.0,
            green: 0xE8/255.0,
            blue: 0xF0/255.0,
            alpha: 1.0
        )
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.frame = CGRect(x: 10, y: 0, width: 20, height: 20)

        let paddingContainer = UIView(frame: CGRect(x: 0, y: 0, width: 38, height: 20))
        paddingContainer.addSubview(iconImageView)

        leftView = paddingContainer
        leftViewMode = .always
    }
}
