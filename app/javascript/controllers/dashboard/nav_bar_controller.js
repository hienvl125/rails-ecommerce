import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "accountButton",
    "accountDropdownContent",
  ]

  connect() {
    this.listenClickOutsideOfAccountTargets()
  }

  listenClickOutsideOfAccountTargets() {
    document.addEventListener("click", (event) => {
      if (!this.accountButtonTarget.contains(event.target) && !this.accountDropdownContentTarget.contains(event.target)) {
        this.accountDropdownContentTarget.classList.add("invisible")
      }
    })
  }

  onClickAccountButton() {
    this.accountDropdownContentTarget.classList.toggle("invisible")
  }
}
