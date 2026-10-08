//
//  TopWaveView.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 06/10/26.
//

import UIKit

class TopWaveView: UIView {

    private let gradientLayer = CAGradientLayer()
    private let radialGlowLayer = CAGradientLayer()
    private let shapeMask = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupWave()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupWave()
    }

    private func setupWave() {
        
        self.backgroundColor = .clear
        
        // Colores extraídos del diseño
        let startColor = UIColor(red: 0x1E/255.0, green: 0x40/255.0, blue: 0xAF/255.0, alpha: 1.0).cgColor  // Azul brillante (#2563EB)
        let endColor = UIColor(red: 0x0B/255.0, green: 0x12/255.0, blue: 0x20/255.0, alpha: 0.1).cgColor  // Azul transparente / oscuro
        
        // 💡 Transición rápida: se vuelve transparente cerca del 40%-50%
        gradientLayer.locations = [0.0, 0.90]

        gradientLayer.colors = [startColor, endColor]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0) // Esquina superior derecha
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)   // Esquina inferior izquierda
        
        
        let glowBright = UIColor(red: 0xDB/255.0, green: 0xEA/255.0, blue: 0xFE/255.0, alpha: 0.85).cgColor // Centro: Blanco/Cian luminoso (Sube alpha para más brillo)
        let glowMid = UIColor(red: 0x25/255.0, green: 0x63/255.0, blue: 0xEB/255.0, alpha: 0.4).cgColor     // Medio: Azul eléctrico translúcido
        let glowClear = UIColor.clear.cgColor                                                             // Borde exterior: Totalmente transparente

        radialGlowLayer.type = .radial // Convierte el degradado lineal en un círculo/halo de luz
        radialGlowLayer.colors = [glowBright, glowMid, glowClear]
        
        // Controla la distribución/radio del brillo:
        // 0.0 = Centro exacto, 0.35 = Distancia del tono medio, 1.0 = Límite donde se apaga la luz
        radialGlowLayer.locations = [0.0, 0.35, 1.0]

        // Ubicación exacta donde "nace" el destello (x: 0.0 = Izquierda, y: 1.0 = Fondo inferior)
        radialGlowLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        
        // Cuán lejos se expande el halo hacia el interior de la pantalla
        radialGlowLayer.endPoint = CGPoint(x: 0.0, y: 0.50)

        layer.addSublayer(gradientLayer)
        layer.addSublayer(radialGlowLayer)
        layer.mask = shapeMask
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        radialGlowLayer.frame = bounds
        shapeMask.path = createTopWavePath().cgPath
    }

    private func createTopWavePath() -> UIBezierPath {
        let path = UIBezierPath()
        let width = bounds.width
        let height = bounds.height

        // Inicio en la esquina superior izquierda de la vista
        path.move(to: CGPoint(x: 0, y: height))
        
        // Curva suave hacia el borde derecho
        path.addCurve(
            to: CGPoint(x: width, y: height * 0.3),
            controlPoint1: CGPoint(x: width * 0.33, y: height * 0.90),
            controlPoint2: CGPoint(x: width * 0.80, y: height * 0.8)
        )
        
        // Cerrar el trazado por los bordes derechos y superiores
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.close()

        return path
    }
}
