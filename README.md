# ⚡ TaskPulse — iOS Team Task & Project Management

TaskPulse es una solución SaaS móvil diseñada para la gestión, asignación y seguimiento en tiempo real de tareas y proyectos para equipos de trabajo. El proyecto está construido bajo estándares de arquitectura limpia y escalabilidad de nivel producción en iOS.

---

## 🛠️ Stack Técnico y Arquitectura

* **Lenguaje:** Swift (Nativo)
* **Interfaz de Usuario:** UIKit (Programático y Storyboards)
* **Patrón de Arquitectura:** MVVM-R (Model-View-ViewModel + Router)
* **Principios de Diseño:** Clean Architecture & SOLID
* **Modularización:** Desacoplamiento mediante `ModuleBuilder`
* **Persistencia Local:** Core Data (`NSManagedObject`, `NSPredicate`)
* **Capa de Red:** `URLSession` nativo con `Codable` y `async/await`
* **Pruebas y Calidad:** TDD (Test-Driven Development) con Swift Testing
* **Control de Versiones:** Git Flow (Branching, Pull Requests, Code Reviews)

---

## 🏗️ Estructura del Proyecto

```text
TaskPulse/
├── App/                # Configuración global, AppDelegate, SceneDelegate
├── Core/               # Componentes transversales (Red, Storage, Extensions)
├── Modules/            # Módulos de la app (MVVM-R)
├── DesignSystem/       # Tokens de diseño (Colores, Fuentes) y componentes reutilizables
└── Resources/          # Assets, Fonts, LaunchScreen
