/* 7 falsey values
   null
   undefined
   0, -0
   NaN
   ''
   false

Variable Instantiation vs Declaration
  const fruit = 'banana'     
  const fruit = 'mango' returns SyntaxError: Identifier 'fruit' has already been declared'
  const fruit returns SyntaxError: Missing initializer in const declaration

  You hava access to constants/variables defined on an outer scope, but not on an inner scope

JS Data Types - primitives and objects
  Primitives
    - Boolean
    - Null
    - Undefined
    - Number
    - String
    - Symbols
    - BigInt

  Primitive Data Types are immutable
    - they are not objects
    - they do not have methods

  Objects
    - Different than a ruby object!
    - Essentially just a big hash-map
    - Often called Plain Old Javascript Objects or POJOs
    - Can have functions as values (called methods)
    - Can access object attributes (properties) with [] or . notations

  Functions
    - Are a type of Object
    - First-class object in JS:
      - Pass them around (as arguments)
      - Return them from other functions
      - Assign them to variables
    We can:
      - Store them in data structures
      - Give them as many or few arguments as we want

    The 3 Types of Functions
      - Named function
      - Variable assignment / anonymous functions
        - aka Function Expression
      - Constructor function

      Constructor Functions
        - Used to create new objects
        - Similar to class definitions Ruby
          - function User(username, age) {
            this.username = username;
            this.age = age;
            this.func = this;
            this.greet = () => "hello there";
          }
           
        - Instance methods are added to the prototype of an object

Functions Demo
  function User(username, age) {
    this.username = username;
    this.age = age;
    this.func = this;
    this.greet = () => "hello there";
  }

  User.prototype.greet = function() {
    return "hello there";
  }

3 Ways to Invoke a Function
  Method Style
    - car.drive();
  Function style
    - findSquareRoot(36);
  Constructor style
    - const res

This
  - Like Ruby's "self"
  - never implicit
  - value of this is a function's Context or Receiver

Callbacks
  - Just a function that is passed as an argument to another function
  - can be as simple as passing a function to forEach

Closures
  - A function which accesses variables that were neither passed in nor defined inside that funciton

  1. A function that captures free variables and "closes" over them
  2. Can be used to create "private state"

Debugging
  Be able to answer the following answer questions when debugging:
    1. Have I declared variables properly?
    2. Do I have access to variables in a particular scope?
    3. What does this reference?
    4. Am I returning values?
    5. Do I have semicolons in the right places?
    6. Am I invoking this function correctly? Do I need to be invoking it?








*/
  
