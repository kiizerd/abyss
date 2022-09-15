import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "body", "chevron" ]

  toggle_body() {
    console.log("Toggling body display..")

    const bodyElement = this.bodyTarget
    const chevronElement = this.chevronTarget

    bodyElement.classList.toggle("hidden")
    chevronElement.classList.toggle("rotate-180")
  }
}