import React from 'react'; 
import ReactDOM from 'react-dom';

import configureStore from './store/store';
import { receiveTodo } from './actions/todo_actions.js';

document.addEventListener("DOMContentLoaded", () => {
  const content = document.getElementById("content");
  
  ReactDOM.render(<h1>Todos App</h1>, content);
})