const Util = require("./util.js");
const MovingObject = require("./moving_object.js");

const DEFAULTS = {
  radius: 5,
  color: "#00FF00"
}

Asteroid.radius = 5;
Asteroid.color = "#00FF00";

function Asteroid(object) {
  // this.vel = Util.randomVec(10);
  // this.pos = object.pos;
  object.color = DEFAULTS.color;
  object.radius = Asteroid.radius;
  object.vel = Util.randomVec(10);
  MovingObject.call(this, object);
}


Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;



