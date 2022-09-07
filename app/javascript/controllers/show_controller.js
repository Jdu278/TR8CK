import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="show"
export default class extends Controller {
  static targets = ["div", "showlink"]


  connect() {
    const url = `/?query=noice`
    fetch(url, {headers: {"Accept": "text/plain"}})
            .then(response => response.text())
            .then((data) => {
              this.showlinkTarget.outerHTML = data
            })
    var show = true
    if (show === true) {
      show = false
      (this.showlinkTarget.click())

    }

  }

}
