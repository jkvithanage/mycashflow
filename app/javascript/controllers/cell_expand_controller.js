import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="cell-expand"
export default class extends Controller {
  static targets = ["cell", "button"];

  toggle() {
    this.cellTargets.forEach((cell) => {
      cell.classList.toggle("cell-expanded");
    });
    if (this.cellTarget.classList.contains("cell-expanded")) {
      this.buttonTarget.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-minus" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <path d="M5 12l14 0"></path>
                                    </svg>Collapse table`;
    } else {
      this.buttonTarget.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-plus" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <path d="M12 5l0 14"></path>
                                    <path d="M5 12l14 0"></path>
                                    </svg>Expand table`;
    }
  }
}
