import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "output"]
  connect() { }
  changed() {
    console.log(this.inputTarget.value)
    this.outputTarget.textContent = "Hello " + this.inputTarget.value
  }
}
