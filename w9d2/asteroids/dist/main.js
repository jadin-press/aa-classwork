/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n\nconst DEFAULTS = {\n  radius: 5,\n  color: \"#00FF00\"\n}\n\nAsteroid.radius = 5;\nAsteroid.color = \"#00FF00\";\n\nfunction Asteroid(object) {\n  // this.vel = Util.randomVec(10);\n  // this.pos = object.pos;\n  object.color = DEFAULTS.color;\n  object.radius = Asteroid.radius;\n  object.vel = Util.randomVec(10);\n  MovingObject.call(this, object);\n}\n\n\nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n\n\n\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/bullet.js":
/*!***********************!*\
  !*** ./src/bullet.js ***!
  \***********************/
/***/ (() => {

eval("\n\n//# sourceURL=webpack:///./src/bullet.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\n\nconst DIM_X = window.innerHeight;\nconst DIM_Y = window.innerWidth;\nconst NUM_ASTEROIDS = 10;\n\nfunction Game() {\n  \n  this.asteroids = this.addAsteroids(NUM_ASTEROIDS);\n  \n}\n\nGame.prototype.randomPosition = function() {\n  let x = Math.floor((Math.random() * 100));\n  let y = Math.floor((Math.random() * 100));\n  return [x, y]; // we forgot to make this an actual array\n};\n\nGame.prototype.addAsteroids = function(num) {\n  let arr = []; \n  for(let i = 0; i < num; i++) {\n    let pos = this.randomPosition();\n    let coin = new Asteroid({pos}); // Asteroid takes an object that takes an array, not just an array\n    arr.push(coin);\n  };\n  return arr;\n};\n\nGame.prototype.draw = function(ctx) {\n  ctx.clearRect(0, 0, DIM_X, DIM_Y);\n  for (let i = 0; i < this.asteroids.length; i++){\n    this.asteroids[i].draw(ctx); // forgot this to reference the astroids array\n  }\n};\n\nGame.prototype.moveObjects = function() {\n  for (let i = 0; i < this.asteroids.length; i++) {\n    this.asteroids[i].move();\n  }\n}\n\nmodule.exports = Game;\n\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("\n\n//  The GameView should store a Game ...\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\n\n// ... and take in and store a drawing ctx.\n// const ctx = canvasEl.getContext(\"2d\");\n// const canvasEl = document.getElementById(\"game-canvas\");\n// question: do we do this in our game_view file or our index?\n\n\n// Define a GameView class\nfunction GameView(ctx) {\n  this.ctx = ctx;\n  this.game = new Game();\n// we can use CTX here now???\n}\n\nGameView.prototype.start = function() {\n  // It should call setInterval to call Game.prototype.moveObjects and Game.prototype.draw once every 20ms or so.\n  let that = this; // must save scope\n  setInterval(function(){ // only one function!\n    that.game.moveObjects();\n    that.game.draw(that.ctx);\n  }, 20);\n\n}\n\nmodule.exports = GameView;\n\n// \n/*\nIn general, a game has one core game loop.\nThe steps are:\nPerform the game logic\nDraw\nIn this example, \nThis means we only want one setInterval.\n\nContext in the start function:\nWe don't have the right context in the anonymous function, because we need the correct this context to correctly call the functions on the game instance, which we can only access if we're in the GameView context.\nSolution: that = this; (and then set that.method when calling methods)\nIf we miss this step, we get this error:\nCannot read property 'moveObjects' of undefined\n*/\n\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("console.log(\"Webpack is working!\")\n\n// index.js\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\n\n\n\ndocument.addEventListener(\"DOMContentLoaded\", function() {\n  const canvasEl = document.getElementById(\"game-canvas\");\n  const ctx = canvasEl.getContext(\"2d\"); //do we do the above two lines in our game view or in the index?\n\n  // From Drunken Circles:\n  // canvasEl.height = window.innerHeight;\n  // canvasEl.width = window.innerWidth;\n\n  // window.GameView = GameView; // Can only have one window.[object_name] at a time? \n  // Commenting this out because we define the GameView class on the window in the GameView file.\n  window.GameView = GameView; \n  new window.GameView(ctx).start();\n});\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("// moving_object.js\nconst MO = {\n  pos: [30, 30],\n  vel: [10, 10],\n  radius: 5,\n  color: \"#00FF00\"\n};\n\nfunction MovingObject(object) {\n  this.pos = object.pos;\n  this.vel = object.vel;\n  this.radius = object.radius;\n  this.color = object.color;\n\n}\n\n\n\nconst mo = new MovingObject({\n  pos: [30, 30],\n  vel: [10, 10],\n  radius: 5,\n  color: \"#00FF00\"\n});\n\n// why do we have to have = function here?\n// how to draw a circle on canvas: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/arc \nMovingObject.prototype.draw = function(ctx) { //setting a key/value pair on the prototype object. If we were using class syntax, we could have said draw(ctx) {}\n  ctx.fillStyle = this.color;\n  ctx.beginPath();\n  ctx.arc(\n    this.pos[0], // The horizontal coordinate of the arc's center.\n    this.pos[1], // The vertical coordinate of the arc's center.\n    this.radius, // The arc's radius. Must be positive.\n    0, // The angle at which the arc starts in radians, measured from the positive x-axis.\n    2 * Math.PI,\n    false\n  );\n  // Draw a circle of the appropriate radius centered at pos. \n  // Fill it with the appropriate color\n  ctx.fill();\n};\n\nMovingObject.prototype.move = function() {\n  this.pos[0] += this.vel[0];\n  this.pos[1] += this.vel[1];\n};\n\nmodule.exports = MovingObject;\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/***/ (() => {

eval("\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/***/ ((module) => {

eval("const Util = {\n  inherits(childClass, parentClass) { // Don't need 'function' keyword when replacing it with the function name\n    function Surrogate() { };\n    Surrogate.prototype = parentClass.prototype;\n    childClass.prototype = new Surrogate();\n    childClass.prototype.constructor = childClass;\n  },\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }\n};\n\nconst getRandomVec = {\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }\n};\n\n// Util.inherits = function (childClass, parentClass) {\n\n//   function Surrogate() { };\n//   Surrogate.prototype = parentClass.prototype;\n//   childClass.prototype = new Surrogate();\n//   childClass.prototype.constructor = childClass;\n// };\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;