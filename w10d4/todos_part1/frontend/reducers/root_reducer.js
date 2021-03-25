import { combineReducers } from 'redux';
import todosReducer from './todos_reducer.js';

export default rootReducer =  combineReducers({
  todos: todosReducer
})