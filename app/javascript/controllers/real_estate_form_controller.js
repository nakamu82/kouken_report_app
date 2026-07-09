import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["select", "land", "building"]

  connect(){
    this.toggle()
  }

  toggle(){
    if(this.selectTarget.value === "土地"){
      this.landTarget.style.display = "block"
      this.buildingTarget.style.display = "none"
    } else {
      this.landTarget.style.display = "none"
      this.buildingTarget.style.display = "block"
    }
  }
}