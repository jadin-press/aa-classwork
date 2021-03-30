

//  The GameView should store a Game ...
const Game = require("./game.js");


// ... and take in and store a drawing ctx.
// const ctx = canvasEl.getContext("2d");
// const canvasEl = document.getElementById("game-canvas");
// question: do we do this in our game_view file or our index?


// Define a GameView class
function GameView(ctx) {
  this.ctx = ctx;
  this.game = new Game();
// we can use CTX here now???
}

GameView.prototype.start = function() {
  // It should call setInterval to call Game.prototype.moveObjects and Game.prototype.draw once every 20ms or so.
  let that = this; // must save scope
  setInterval(function(){ // only one function!
    that.game.moveObjects();
    that.game.draw(that.ctx);
  }, 20);

}

module.exports = GameView;

// 
/*
In general, a game has one core game loop.
The steps are:
Perform the game logic
Draw
In this example, 
This means we only want one setInterval.

Context in the start function:
We don't have the right context in the anonymous function, because we need the correct this context to correctly call the functions on the game instance, which we can only access if we're in the GameView context.
Solution: that = this; (and then set that.method when calling methods)
If we miss this step, we get this error:
Cannot read property 'moveObjects' of undefined
*/
