// moving_object.js
const MO = {
  pos: [30, 30],
  vel: [10, 10],
  radius: 5,
  color: "#00FF00"
};

function MovingObject(object) {
  this.pos = object.pos;
  this.vel = object.vel;
  this.radius = object.radius;
  this.color = object.color;

}



const mo = new MovingObject({
  pos: [30, 30],
  vel: [10, 10],
  radius: 5,
  color: "#00FF00"
});

// why do we have to have = function here?
// how to draw a circle on canvas: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/arc 
MovingObject.prototype.draw = function(ctx) { //setting a key/value pair on the prototype object. If we were using class syntax, we could have said draw(ctx) {}
  ctx.fillStyle = this.color;
  ctx.beginPath();
  ctx.arc(
    this.pos[0], // The horizontal coordinate of the arc's center.
    this.pos[1], // The vertical coordinate of the arc's center.
    this.radius, // The arc's radius. Must be positive.
    0, // The angle at which the arc starts in radians, measured from the positive x-axis.
    2 * Math.PI,
    false
  );
  // Draw a circle of the appropriate radius centered at pos. 
  // Fill it with the appropriate color
  ctx.fill();
};

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
};

module.exports = MovingObject;
