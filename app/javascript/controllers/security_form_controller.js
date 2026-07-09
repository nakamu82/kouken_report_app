import { Controller } from "@hotwired/stimulus" 

export default class extends Controller {
  static targets = ["kind", "nameField"]

  connect(){
    this.toggle()
  }

  toggle(){
    if (this.kindTarget.value === "当該財産なし" || this.kindTarget.value === "不明"){
      this.nameFieldTarget.style.display = "none"
    } else {
      this.nameFieldTarget.style.display = "block"
    }
  }
}
