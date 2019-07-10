import React from 'react';
import ReactDOM from 'react-dom';

import TestApp from './TestApp'

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(
    <TestApp />,
    document.querySelector('.col-md-9').appendChild(document.createElement("div")),
  )
})