import flatpickr from "flatpickr";

const datepicker = () => {
  flatpickr(".datepicker", {
    enableTime: true,
    minDate: Date.now()
  });
}


export {datepicker};
