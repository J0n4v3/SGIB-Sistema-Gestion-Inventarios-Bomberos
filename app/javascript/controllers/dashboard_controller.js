import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["alert"]

  connect() {
    console.log("Dashboard controller connected")
  }

  dismissAlert(event) {
    event.preventDefault()

    // Animación de salida
    if (this.hasAlertTarget) {
      this.alertTarget.classList.add('opacity-0', 'scale-95', 'transition-all', 'duration-300')
      setTimeout(() => {
        this.alertTarget.remove()
      }, 300)
    }
  }
}
