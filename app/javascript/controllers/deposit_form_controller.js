import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["bankFields", "facilityFields"]

  switchFields(event) {
    const selectedValue = event.target.value

    // まず両方非表示
    this.bankFieldsTarget.classList.add("hidden")
    this.facilityFieldsTarget.classList.add("hidden")

    // 選択に応じて表示
    if (selectedValue === "金融機関") {
      this.bankFieldsTarget.classList.remove("hidden")
    } else if (selectedValue === "施設等預入金") {
      this.facilityFieldsTarget.classList.remove("hidden")
    }
  }

  connect() {
    const select = this.element.querySelector("select")
    const selectedValue = select.value

    // まず両方非表示
    this.bankFieldsTarget.classList.add("hidden")
    this.facilityFieldsTarget.classList.add("hidden")

    // 選択に応じて表示
    if (selectedValue === "金融機関") {
      this.bankFieldsTarget.classList.remove("hidden")
    } else if (selectedValue === "施設等預入金") {
      this.facilityFieldsTarget.classList.remove("hidden")
    }
  }
}
