import { Controller} from "stimulus"

export default class extends Controller {
  static targets = ["switch", "container"]

  show(){
    this.switchTarget.value = true
    this.toggle()
  }

  hide(){
    this.switchTarget.value = false
    this.toggle()

  }

  toggle(){
    if(this.switchTarget.value == "false"){
      this.containerTarget.classList.remove("d-flex")
      this.containerTarget.classList.add("d-none")

    }else{
      this.containerTarget.classList.add("d-flex")
      this.containerTarget.classList.remove("d-none")
    }
  }

  connect() {
    this.toggle()
  }
}