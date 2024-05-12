import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["message"]

  connect() {
    if (this.hasMessageTarget) {
      setTimeout(() => {
        this.closeMessage()
      }, 5000)
    }
  }

  closeMessage() {
    this.messageTarget.classList.add('opacity-0')
    setTimeout(() => {
      this.messageTarget.remove()
    }, 300)
  }
}
