import { Controller} from "stimulus"

export default class extends Controller {
  static targets = ["location"]

  connect() {
    if (typeof (google) != "undefined"){
      this.autocomplete()
    }
  }

  autocomplete() {
    if (this._autocomplete == undefined) {
      const options = {
        fields: ["geometry"],
        types: ['(regions)'],
        componentRestrictions: { country: 'pl' }
      }
      this._autocomplete = new google.maps.places.Autocomplete(this.locationTarget, options)
      this._autocomplete.addListener('place_changed', () => {
        if (!this._autocomplete.getPlace().hasOwnProperty('name')) {
          this.correctPlaceTarget.value = true
        }
      })
    }
    return this._autocomplete
  }

  preventSubmit(e) {
    if (e.key == "Enter") { e.preventDefault() }
  }
}