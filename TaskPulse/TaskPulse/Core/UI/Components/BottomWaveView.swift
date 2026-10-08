//
//  BottomWaveView.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 06/10/26.
//

import UIKit

class BottomWaveView: UIView {

    // MARK: - Capas de Diseño (Layers)
    
    /// Capa para el degradado azul de fondo dentro de la onda.
    private let baseGradientLayer = CAGradientLayer()
    
    /// Capa de tipo Radial para crear el halo de luz/destello blanco que nace en la esquina.
    private let radialGlowLayer = CAGradientLayer()
    
    /// Máscara vectorial (UIBezierPath) que le da la forma de curva/onda a ambas capas.
    private let shapeMask = CAShapeLayer()

    // MARK: - Inicialización
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupWave()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupWave()
    }

    // MARK: - Configuración de Capas
    
    private func setupWave() {
        self.backgroundColor = .clear

        // -------------------------------------------------------------
        // 1. DEGRADADO BASE AZUL
        // -------------------------------------------------------------
        // Cambia estos HEX si quieres modificar la tonalidad azul de la figura.
        let primaryBlue = UIColor(red: 0x1E/255.0, green: 0x40/255.0, blue: 0xAF/255.0, alpha: 1.0).cgColor // Azul principal
        let darkBlue = UIColor(red: 0x0B/255.0, green: 0x12/255.0, blue: 0x20/255.0, alpha: 0.1).cgColor    // Azul muy oscuro desvanecido

        baseGradientLayer.colors = [primaryBlue, darkBlue]
        
        // Dirección del degradado azul (de esquina inferior izquierda a esquina superior derecha)
        baseGradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        baseGradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)

        // -------------------------------------------------------------
        // 2. DESTELLO RADIAL INTERNO (Luz en la esquina inferior izquierda)
        // -------------------------------------------------------------
        // Define los colores del destello desde el centro del brillo hacia afuera.
        let glowBright = UIColor(red: 0xDB/255.0, green: 0xEA/255.0, blue: 0xFE/255.0, alpha: 0.85).cgColor // Centro: Blanco/Cian luminoso (Sube alpha para más brillo)
        let glowMid = UIColor(red: 0x25/255.0, green: 0x63/255.0, blue: 0xEB/255.0, alpha: 0.4).cgColor     // Medio: Azul eléctrico translúcido
        let glowClear = UIColor.clear.cgColor                                                             // Borde exterior: Totalmente transparente

        radialGlowLayer.type = .radial // Convierte el degradado lineal en un círculo/halo de luz
        radialGlowLayer.colors = [glowBright, glowMid, glowClear]
        
        // Controla la distribución/radio del brillo:
        // 0.0 = Centro exacto, 0.35 = Distancia del tono medio, 1.0 = Límite donde se apaga la luz
        radialGlowLayer.locations = [0.0, 0.35, 1.0]

        // Ubicación exacta donde "nace" el destello (x: 0.0 = Izquierda, y: 1.0 = Fondo inferior)
        radialGlowLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        
        // Cuán lejos se expande el halo hacia el interior de la pantalla
        radialGlowLayer.endPoint = CGPoint(x: 0.85, y: 0.3)

        // -------------------------------------------------------------
        // 3. ENSAMBLE DE CAPAS
        // -------------------------------------------------------------
        layer.addSublayer(baseGradientLayer)
        layer.addSublayer(radialGlowLayer)

        // La máscara corta las dos capas con la silueta de la curva Bézier
        layer.mask = shapeMask
    }

    // MARK: - Disposición de Pantalla
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let path = createBottomWavePath()
        
        // Ajustamos los tamaños al marco actual de la vista
        baseGradientLayer.frame = bounds
        radialGlowLayer.frame = bounds
        shapeMask.path = path.cgPath
    }

    // MARK: - Trazado Vectorial de la Onda
    
    private func createBottomWavePath() -> UIBezierPath {
        let path = UIBezierPath()
        let width = bounds.width
        let height = bounds.height

        // PUNTO DE INICIO: Borde izquierdo (80% de la altura total de la vista)
        path.move(to: CGPoint(x: 0, y: height * 0.70))

        // 1. PRIMERA CURVA (Sube ligeramente a la izquierda y vuelve a bajar):
        // 'to': Punto final del primer tramo.
        // 'controlPoint1' y '2': "Imanes" invisibles que jalan la línea para crear la panza de la onda.
        path.addCurve(
            to: CGPoint(x: width * 0.20, y: height * 0.69),
            controlPoint1: CGPoint(x: width * 0.06, y: height * 0.67), // Si subes Y (ej. 0.50), la primera onda sube más
            controlPoint2: CGPoint(x: width * 0.14, y: height * 0.67)
        )

        // 2. SEGUNDA CURVA (Baja a hacer el valle profundo y sube amplia a la derecha):
        path.addCurve(
            to: CGPoint(x: width, y: height * 0.15),                   // Punto donde se conecta con el borde derecho
            controlPoint1: CGPoint(x: width * 0.33, y: height * 0.72), // Punto más bajo del valle (baja o sube este Y para profundizar la curva)
            controlPoint2: CGPoint(x: width * 0.70, y: height * 0.60)
        )

        // 3. CIERRE DEL RECTÁNGULO (Para rellenar por abajo):
        path.addLine(to: CGPoint(x: width, y: height)) // Esquina inferior derecha
        path.addLine(to: CGPoint(x: 0, y: height))     // Esquina inferior izquierda
        path.close()                                   // Une con el punto inicial

        return path
    }
}
