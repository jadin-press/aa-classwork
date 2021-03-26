import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form.jsx';
// props: {
//     todos: allTodos(state)
//     receiveTodo: todo => dispatch(todoActions.receiveTodo(todo))
// }

const ToDoList = (props) => {
  return (
    <div>
      <h1>These are our to-dos: </h1>
      <ul>
        {
          props.todos.map(todo => <TodoListItem key={todo.id} todo={todo}/>)
        }
      </ul>

      <TodoForm receiveTodo={props.receiveTodo}/>
    </div>
  )
};

export default ToDoList