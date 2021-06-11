import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'end-date' ];

  calculate() {
    const element = this.end_date
    console.log(element);
  }

  refresh() {
    console.log(currentTarget.value)
  }
}