console.log("Webpack is working!")

// index.js
const GameView = require("./game_view.js");



document.addEventListener("DOMContentLoaded", function() {
  const canvasEl = document.getElementById("game-canvas");
  const ctx = canvasEl.getContext("2d"); //do we do the above two lines in our game view or in the index?

  // From Drunken Circles:
  // canvasEl.height = window.innerHeight;
  // canvasEl.width = window.innerWidth;

  // window.GameView = GameView; // Can only have one window.[object_name] at a time? 
  // Commenting this out because we define the GameView class on the window in the GameView file.
  window.GameView = GameView; 
  new window.GameView(ctx).start();
});

