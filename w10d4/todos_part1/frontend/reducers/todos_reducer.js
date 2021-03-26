import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from '../actions/todo_actions';

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false,
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true,
  }
};

// [{ id: 3, title: "wash cat", body: "with water", done: false }, 
// { id: 4, title: "clean room", body: "make spotless", done: true }]

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  const nextState = Object.assign({}, state);
  const newState = {}

  switch (action.type) {
    case RECEIVE_TODOS:
      action.todos.forEach((el) => {
        newState[el.id] = el;
      })
      return newState;
    case RECEIVE_TODO:
      nextState[action.todo.id] = action.todo;
      return nextState;
    case REMOVE_TODO:
      // for (let i = 0; i < Object.values(state).length; i++) {
      //   // debugger;
      //   let todo = Object.values(state)[i];
      //   if (todo.id !== action.todo.id) {
      //     newState[todo.id] = state[todo.id];
      //   };
      // };
      
      delete nextState[action.todo.id];
      return nextState;
      // nextState[action.todo.id] = {};
      // return nextState;
    default:
      return state;
  };
};

export default todosReducer;