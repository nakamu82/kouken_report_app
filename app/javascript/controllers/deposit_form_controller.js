import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["bankFields", "facilityFields", "supportFields"]

  switchFields(event) {
    const selectedValue = event.target.value

    this.disableAll()

    if (selectedValue === "金融機関") {
      this.enable(this.bankFieldsTarget)
    } else if (selectedValue === "施設等預入金") {
      this.enable(this.facilityFieldsTarget)
    } else if (selectedValue === "支援信託" || selectedValue === "支援預貯金") {
      this.enable(this.supportFieldsTarget)
    }
  }

  connect() {
    const select = this.element.querySelector("select")
    const selectedValue = select.value

    this.disableAll()

    if (selectedValue === "金融機関") {
      this.enable(this.bankFieldsTarget)
    } else if (selectedValue === "施設等預入金") {
      this.enable(this.facilityFieldsTarget)
    } else if (selectedValue === "支援信託" || selectedValue === "支援預貯金") {
      this.enable(this.supportFieldsTarget)
    }
  }

  disableAll() {
    [this.bankFieldsTarget, this.facilityFieldsTarget, this.supportFieldsTarget].forEach(target => {
      target.classList.add("hidden")
      target.querySelectorAll("input, select").forEach(el => el.disabled = true)
    })
  }

  enable(target) {
    target.classList.remove("hidden")
    target.querySelectorAll("input, select").forEach(el => el.disabled = false)
  }
}
