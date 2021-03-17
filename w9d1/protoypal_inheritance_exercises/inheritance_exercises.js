// Function.prototype.inherits = function(parent) {
//   function Surrogate() {};
//   Surrogate.prototype = parent.prototype;
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this;
// }


function MovingObject (name) {
  this.name = name
  // this.moves = function() {
  //   console.log(`${name} is moving`)
  // }
}

MovingObject.prototype.moves = function() {
  console.log(`${this.name} is moving`)
}

// Ship.inherits(MovingObject);

function Ship (name) {
  this.name = name
}


function Asteroid (name) {
  this.name = name;
}

// Asteroid.inherits(MovingObject);

Asteroid.prototype.hits = function() {
  console.log(`${this.name} struck the earth`)
}




Ship.prototype = Object.create(MovingObject.prototype)
Asteroid.prototype = Object.create(MovingObject.prototype)


let newMovingObject = new MovingObject("Gerald")
let newShip = new Ship("Tim")
let newAsteroid = new Asteroid("Johnson")

console.log(newAsteroid.moves())