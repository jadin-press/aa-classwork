const View = require("./ttt-view.js")
const Game = require("../../tic-tac-toe_node-solution/game.js")


  $(() => {
    console.log("Game is working")
    const newGame = new Game();
    const el = $(".ttt");
    new View(newGame, el);
  });

