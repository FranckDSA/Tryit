import flatpickr from "flatpickr";

const datepicker = () => {
  flatpickr(".datepicker", {
    enableTime: true
  });
}


export {datepicker};
