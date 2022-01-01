import { Controller} from "stimulus"

export default class extends Controller {
  static targets = ["container", "item"]

  search(event) {
    const value = event.target.value
    this.itemTargets.forEach(element => {
      if (element.innerHTML.indexOf(value) !== -1) {
        if (!element.hasAttribute("data-chosen")) {
          element.classList.remove('d-none')
        }
      } else {
        element.classList.add('d-none')
      }
    });
  }

  chosen(event) {
    event.preventDefault()
    event.target.classList.add('d-none')
    event.target.dataset.chosen = true
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

    const hiddenField = document.createElement("input")
    hiddenField.value = id
    hiddenField.type = "hidden"
    hiddenField.name = `item[genres][]`

    this.containerTarget.appendChild(newBadge)
    this.containerTarget.appendChild(hiddenField)
  }

  removeGenre(event) {
    const item = this.itemTargets.find(({id}) => id === event.target.dataset.id)
    item.classList.remove('d-none')
    item.removeAttribute('data-chosen')
    event.target.parentElement.remove()
  }
}