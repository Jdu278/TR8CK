import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-habits"
export default class extends Controller {
  static targets = ["form", "input", "habits", "chat", "chatinput"]

  connect() {
    console.log(this.formTarget)
    console.log(this.inputTarget)
    console.log(this.habitsTarget)
  //   this.inputTarget.addEventListener("keyup", ({key}) => {

  //     // if (Event.isComposing || key === "Enter") {
  //     if (key === "Enter") {

  //       this.chatTarget.classList.remove("invisible")
  //       this.habitsTarget.classList.add("invisible")
  //       this.formTarget.classList.add("invisible")
  //       this.inputTarget.removeEventListener()
  //       this.formTarget.preventDefault()
  //     }
  //     else
  //       {const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
  //       fetch(url, {headers: {"Accept": "text/plain"}})
  //       .then(response => response.text())
  //       .then((data) => {
  //         console.log(data)
  //         this.habitsTarget.outerHTML = data
  //         // this.listTarget.outerHTML = data
  //       })}
  // })

    this.inputTarget.addEventListener("submit", ({key}) => {

        // if (Event.isComposing || key === "å") {
      // if (key === "å") {

        const url = `${this.formTarget.action}?creationquery=${this.inputTarget.value}`
        fetch(url, {headers: {"Accept": "text/plain"}})
        .then(response => response.text())
        .then((data) => {
          console.log({data})
          this.habitsTarget.outerHTML = data
        })
      // }
     }
    )

    this.inputTarget.addEventListener("keyup", ({key}) => {

        {const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
        fetch(url, {headers: {"Accept": "text/plain"}})
        .then(response => response.text())
        .then((data) => {
          console.log(data)
          this.habitsTarget.outerHTML = data
          // this.listTarget.outerHTML = data
        })}

    })
  }


  // ?new_habit=blank





  update() {

    if (this.formTarget.Event.key != "Enter")
      {const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
      fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
      console.log(data)
      this.habitsTarget.outerHTML = data
        // this.listTarget.outerHTML = data
      })}
    else
      {
        this.chatTarget.classList.remove("invisible")
      }
    }

  // submitit() {
  //   this.inputTarget.addEventListener("keydown")
  //   if (this.inputTarget.event.key != "Enter"){
  //         this.chatTarget.classList.remove("invisible")
  //       }
  // }
}
