const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Bullet = require("./bullet.js");
const Ship = require("./ship.js");

const DIM_X = window.innerHeight;
const DIM_Y = window.innerWidth;
const NUM_ASTEROIDS = 10;

function Game() {
  
  this.asteroids = this.addAsteroids(NUM_ASTEROIDS);
  
}

Game.prototype.randomPosition = function() {
  let x = Math.floor((Math.random() * 100));
  let y = Math.floor((Math.random() * 100));
  return [x, y]; // we forgot to make this an actual array
};

Game.prototype.addAsteroids = function(num) {
  let arr = []; 
  for(let i = 0; i < num; i++) {
    let pos = this.randomPosition();
    let coin = new Asteroid({pos}); // Asteroid takes an object that takes an array, not just an array
    arr.push(coin);
  };
  return arr;
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, DIM_X, DIM_Y);
  for (let i = 0; i < this.asteroids.length; i++){
    this.asteroids[i].draw(ctx); // forgot this to reference the astroids array
  }
};

Game.prototype.moveObjects = function() {
  for (let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].move();
  }
}

module.exports = Game;
