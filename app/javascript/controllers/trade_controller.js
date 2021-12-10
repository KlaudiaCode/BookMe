import { Controller} from "stimulus"

export default class extends Controller {
  static targets = ["chosenText", "itemIdField"]

  choose(event) {
    this.itemIdFieldTarget.value = event.params.id
    this.chosenTextTarget.innerHTML = event.params.name
  }
}