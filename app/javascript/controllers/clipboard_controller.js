import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "button", "source" ]

  copy() {
    this.sourceTarget.select()
    document.execCommand("copy")

    this.buttonTarget.textContent = "Copied"

    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.buttonTarget.textContent = "Copy"
    }, 1000)
  }
}
