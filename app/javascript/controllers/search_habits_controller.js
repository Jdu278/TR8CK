import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-habits"
export default class extends Controller {
  static targets = ["form", "input", "habits", "chatwindow", "chatinput", "submitit"]

  connect() {
    // console.log(this.formTarget)
    // console.log(this.inputTarget)
    // console.log(this.habitsTarget)
    // console.log(this.submititTarget)

    var create = false
    var created = false
    var newtitle = ""
    var description = false
    var newdescription = ""
    var descriptiondone = false
    var notesdone = false
    var newnotes = false
    var repetitionsdone = false
    var newrepetitions = false
    var mooddone = false
    var newmood = false


        this.submititTarget.addEventListener("click", (event) => {
          // if (created === false) {
            event.preventDefault()
            if (this.inputTarget.value !== "yes" && create === false) newtitle = this.inputTarget.value

            const url = `${this.formTarget.action}?creationquery=${this.inputTarget.value}`
            fetch(url, {headers: {"Accept": "text/plain"}})
            .then(response => response.text())
            .then((data) => {
              var chatw = document.getElementsByClassName("chat")
              if (chatw.length === 0 ){
              this.habitsTarget.outerHTML = data

            }

            this.inputTarget.value = ""
            })


            var chatw = document.getElementsByClassName("chat")

            var messages = document.getElementsByClassName("message")


            if (chatw.length === 1 && this.inputTarget.value === "yes" && create === false){

                create = true

                messages[0].insertAdjacentHTML("beforebegin", `<p class="userhere message">Yes.`)
                messages[0].insertAdjacentHTML("beforebegin", `<p class="bothere message">Great! "${newtitle}" has been created! Would you like to add a description?</p>`)
            }

            else if (chatw.length === 1 && this.inputTarget.value === "yes" && create === true && description === false && descriptiondone === false) {

              messages[0].insertAdjacentHTML("beforebegin", `<p class="userhere message">Yes.`)
              messages[0].insertAdjacentHTML("beforebegin", `<p class="bothere message">Please type in the description below.</p>`)

              description = true

            }

            else if (chatw.length === 1 && this.inputTarget.value === "no" && create === true && description === false && descriptiondone === false) {

              messages[0].insertAdjacentHTML("beforebegin", `<p class="userhere message">No.`)
              messages[0].insertAdjacentHTML("beforebegin", `<p class="bothere message">Roger that! No description for "${newtitle}" habit. Would you like to add notes in the future?</p>`)

              descriptiondone = true
            }

            else if (chatw.length === 1 && description === true && descriptiondone === false) {

              messages[0].insertAdjacentHTML("beforebegin", `<p class="userhere message">${this.inputTarget.value}`)
              messages[0].insertAdjacentHTML("beforebegin", `<p class="bothere message">Description for "${newtitle}" is: "${this.inputTarget.value}". Would you like to add notes to the habit?</p>`)

              newdescription = this.inputTarget.value
              descriptiondone = true
            }

            else if (chatw.length === 1 && notesdone === false && descriptiondone === true && this.inputTarget.value === "no") {

              messages[0].insertAdjacentHTML("beforebegin", `<p class="userhere message">${this.inputTarget.value}`)
              messages[0].insertAdjacentHTML("beforebegin", `<p class="bothere message">Roger that! No notes for "${newtitle}" habit. Would you like to add repetitions to the habit?</p>`)

              notesdone = true
            }


            else if (chatw.length === 1 && notesdone === false && descriptiondone === true && this.inputTarget.value === "yes") {

              messages[0].insertAdjacentHTML("beforebegin", `<p class="userhere message">${this.inputTarget.value}`)
              messages[0].insertAdjacentHTML("beforebegin", `<p class="bothere message">Notes option added to the "${newtitle}" habit. Would you like to add repetitions to the habit?</p>`)

              newnotes = true
              notesdone = true
            }

            else if (chatw.length === 1 && notesdone === true && repetitionsdone === false && this.inputTarget.value === "no") {

              messages[0].insertAdjacentHTML("beforebegin", `<p class="userhere message">${this.inputTarget.value}`)
              messages[0].insertAdjacentHTML("beforebegin", `<p class="bothere message">Roger that! No repetitions for "${newtitle}" habit. Would you like to add mood rating to the habit?</p>`)

              repetitionsdone = true
            }


            else if (chatw.length === 1 && notesdone === true && repetitionsdone === false && this.inputTarget.value === "yes") {

              messages[0].insertAdjacentHTML("beforebegin", `<p class="userhere message">${this.inputTarget.value}`)
              messages[0].insertAdjacentHTML("beforebegin", `<p class="bothere message">Repetitions count added to the "${newtitle}" habit. Would you like to add mood rating to the habit?</p>`)

              newrepetitions = true
              repetitionsdone = true
            }

            else if (chatw.length === 1 && mooddone === false && repetitionsdone === true && this.inputTarget.value === "no") {

              messages[0].insertAdjacentHTML("beforebegin", `<p class="userhere message">${this.inputTarget.value}`)
              messages[0].insertAdjacentHTML("beforebegin", `<p class="bothere message">Roger that! No mood monitoring for "${newtitle}" habit. Almost done! Type "create" to save the habbit.</p>`)
              created = true
              mooddone = true

            }


            else if (chatw.length === 1 && mooddone === false && repetitionsdone === true && this.inputTarget.value === "yes") {

              messages[0].insertAdjacentHTML("beforebegin", `<p class="userhere message">${this.inputTarget.value}`)
              messages[0].insertAdjacentHTML("beforebegin", `<p class="bothere message">Mood monitoring added to the "${newtitle}" habit. Almost done! Type "create" to save the habbit.</p>`)
              created = true
              newmood = true
              mooddone = true

            }

            else if (chatw.length === 1 && created === true && this.inputTarget.value === "create") {

              let newneeded_session_properties=[]
              if (newrepetitions === true) newneeded_session_properties.push("repetitions")
              if (newmood === true) newneeded_session_properties.push("mood")
              if (newnotes === true) newneeded_session_properties.push("note")
              messages[0].insertAdjacentHTML("beforebegin", `<p class="bothere message">
                saving habit...
                  <form action="/habits" method="post">
                  <input name="title" type="hidden" value="${newtitle}" />
                  <input name="description" type="hidden" value="${newdescription}" />
                  <input name="needed_session_properties" type="hidden" value="${newneeded_session_properties}" />

                  <input type="submit" value="Submit" id="clickme">
                  </form>
                </p>`
              )

               create = false
               created = false
               newtitle = ""
               description = false
               newdescription = ""
               descriptiondone = false
               notesdone = false
               newnotes = false
               repetitionsdone = false
               newrepetitions = false
               mooddone = false
               newmood = false

              document.getElementById('clickme').click();
            }

            else if (chatw.length === 1 && this.inputTarget.value !== ""){

              messages[0].insertAdjacentHTML("beforebegin", `<p class="userhere message"> ${this.inputTarget.value}!</p>`)
              if (create === false) messages[0].insertAdjacentHTML("beforebegin", `<p class="bothere message">sorry, I didn't get that. Would you like to create a new habit named "${newtitle}"?</p>`)
              else messages[0].insertAdjacentHTML("beforebegin", `<p class="bothere message">You seem tired. Perhaps take a nap and get back to this later?</p>`)
            }
          // }



        })


        this.inputTarget.addEventListener("keyup", ({key}) => {
          var chatw = document.getElementsByClassName("chat")
          console.log(chatw.length)
          if (chatw.length === 0)
          {const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
          fetch(url, {headers: {"Accept": "text/plain"}})
          .then(response => response.text())
          .then((data) => {
            console.log("keyup")
            this.habitsTarget.outerHTML = data
            // document.body.scrollIntoView(this.habitsTarget)
            // console.log(this.habitsTarget);

          })}
          // this.inputTarget.focus()

        })
  }



}
