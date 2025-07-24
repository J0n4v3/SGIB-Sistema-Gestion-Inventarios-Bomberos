import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configurar experiencia de desarrollo Stimulus
application.debug = false
window.Stimulus   = application

export { application }
