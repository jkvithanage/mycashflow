import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="alert"
export default class extends Controller {
  async connect() {
    await this.show();
    await this.hide();
    setTimeout(() => {
      this.close();
    }, 1000);
  }

  close() {
    this.element.remove()
    console.log("close");
  }

  show() {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve(this.element.setAttribute("style", "transition: 1s; opacity: 1;"));
        console.log("show");
      }, 10);
    });
  }

  hide() {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve(this.element.setAttribute("style", "transition: 1s; opacity: 0;"));
        console.log("hide");
      }, 2500);
    });
  }
}
