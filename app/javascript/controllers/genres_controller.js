import { Controller} from "stimulus"

export default class extends Controller {
  static targets = ["container", "item"]

  search() {
    console.log("Search")
  }

  chosen(event) {
    event.preventDefault()
    event.target.classList.add('d-none')
    this.createBadge(event.params.name, event.target.id)
  }

  createBadge(name, id) {
    const newBadge = document.createElement("span")
    newBadge.classList.add("badge","bg-primary","me-1")
    newBadge.innerHTML = name
    const closeButton = document.createElement("button")
    closeButton.type = "button"
    closeButton.ariaLabel = "Close"
    closeButton.classList.add("btn-close", "btn-close-white", "ms-1")
    closeButton.dataset.id = id
    closeButton.dataset.action = "genres#removeGenre"
    newBadge.appendChild(closeButton)
    this.containerTarget.appendChild(newBadge)
  }

  removeGenre(event) {
    const item = this.itemTargets.find(({id}) => id === event.target.dataset.id)
    item.classList.remove('d-none')
    event.target.parentElement.remove()
  }
}