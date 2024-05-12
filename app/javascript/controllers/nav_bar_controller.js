import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["accountButton", "accountDropdownContent", "cartButton", "cartDropdownContent"]

  connect() {
    this.listenClickOutsideOfAccountTargets()
    this.listenClickOutsideOfCartTargets()
    
  }

  listenClickOutsideOfAccountTargets() {
    document.addEventListener("click", (event) => {
      if (!this.accountButtonTarget.contains(event.target) && !this.accountDropdownContentTarget.contains(event.target)) {
        this.accountDropdownContentTarget.classList.add("invisible")
      }
    })
  }

  listenClickOutsideOfCartTargets() {
    document.addEventListener("click", (event) => {
      if (!this.cartButtonTarget.contains(event.target) && !this.cartDropdownContentTarget.contains(event.target)) {
        this.cartDropdownContentTarget.classList.add("invisible")
      }
    })
  }

  onClickAccountButton() {
    this.accountDropdownContentTarget.classList.toggle("invisible")
  }

  onClickCartButton() {
    this.cartDropdownContentTarget.classList.toggle("invisible")
  }
}
