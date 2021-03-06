import React from 'react'; 
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import { receiveTodo, receiveTodos, removeTodo } from './actions/todo_actions';
import { receiveSteps, receiveStep, removeStep } from './actions/step_actions';
import Root from "./components/root.jsx";
import allTodos from "./reducers/selectors.js";

 
document.addEventListener("DOMContentLoaded", () => {
  const content = document.getElementById("content");
  const store = configureStore();
  
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.removeTodo = removeTodo;
  window.receiveSteps = receiveSteps;
  window.receiveStep = receiveStep;
  window.removeStep = removeStep;
  window.allTodos = allTodos;
  
  ReactDOM.render(<Root store={store} />, content);
})