// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction

import { Controller } from "stimulus"


export default class extends Controller {
  static targets = [ "field", "map", "latitude", "longitude", "address", "name", "number", "street", "city", "state", "postcode", "country" ]

  connect() {
    if (typeof(google) != "undefined") {
      this.initMap()
    }
  }

  initMap() {
    this.map = new google.maps.Map(this.mapTarget, {
      center: new google.maps.LatLng(this.data.get("latitude") || 39.5, this.data.get("longitude") || -98.35),
      zoom: (this.data.get("latitude") == null ? 4 : 16),
      zoomControl: false,
      streetViewControl: false,
      mapTypeControl: false,
      fullscreenControl: false,
      gestureHandling: "none",
      clickableIcons: false
    })

    this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget)
    this.autocomplete.bindTo('bounds', this.map)
    this.autocomplete.setFields(['address_components', 'formatted_address', 'geometry', 'icon', 'name'])
    this.autocomplete.addListener('place_changed', this.placeChanged.bind(this))

    this.marker = new google.maps.Marker({
      map: this.map,
      anchorPoint: new google.maps.Point(0, -29)
    })
  }

  placeChanged() {
    let place = this.autocomplete.getPlace()

    if (!place.geometry) {
      window.alert(`No details available for input: ${place.name}`)
      return
    }

    if (place.geometry.viewport) {
      this.map.fitBounds(place.geometry.viewport)
    } else {
      this.map.setCenter(place.geometry.location)
      this.map.setZoom(16)
    }

    this.marker.setPosition(place.geometry.location)
    this.marker.setVisible(true)

    this.latitudeTarget.value = place.geometry.location.lat()
    this.longitudeTarget.value = place.geometry.location.lng()
    this.nameTarget.value = place.name
    this.addressTarget.value = place.formatted_address
    this.numberTarget.value = place.address_components.filter(ac=>~ac.types.indexOf('street_number'))[0].long_name
    this.streetTarget.value = place.address_components.filter(ac=>~ac.types.indexOf('route'))[0].short_name
    this.cityTarget.value = place.address_components.filter(ac=>~ac.types.indexOf('locality'))[0].long_name
    this.stateTarget.value = place.address_components.filter(ac=>~ac.types.indexOf('administrative_area_level_1'))[0].short_name
    this.postcodeTarget.value = place.address_components.filter(ac=>~ac.types.indexOf('postal_code'))[0].long_name
    this.countryTarget.value = place.address_components.filter(ac=>~ac.types.indexOf('country'))[0].long_name
  }

  keydown(event) {
    if (event.key == "Enter") {
      event.preventDefault()
    }
  }
}