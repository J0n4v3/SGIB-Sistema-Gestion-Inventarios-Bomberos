import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "modal" ]

  connect() {
    console.log("Modal controller connected to:", this.element)
    this.boundKeydown = this.keydown.bind(this)
    document.addEventListener("keydown", this.boundKeydown)
  }

  disconnect() {
    document.removeEventListener("keydown", this.boundKeydown)
  }

  open(event) {
    if (event) event.preventDefault()
    console.log("Opening modal...", this.modalTarget)
    this.modalTarget.classList.remove("hidden")
  }

  close(event) {
    if (event) event.preventDefault()
    console.log("Closing modal...", this.modalTarget)
    this.modalTarget.classList.add("hidden")
  }

  keydown(event) {
    if (event.key === "Escape") {
      this.close()
    }
  }
}
