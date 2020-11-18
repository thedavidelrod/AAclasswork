/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is not neither made for production nor for readable output files.
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
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module, __webpack_require__ */
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__ (/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__ (/*! ./utils.js */ \"./src/utils.js\");\n\nconst DEFAULT = {\n    color: \"DFFF00\",\n    radius: 20\n}\n\nfunction Asteroid(options) {\n    // this.pos = options.pos; \n    options.vel = Util.randomVec(4)\n    options.color = DEFAULT.color;\n    options.radius = DEFAULT.radius;\n    MovingObject.call(this, options);\n\n}\nUtil.inherits(MovingObject, Asteroid);\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module, __webpack_require__ */
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__ (/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Util = __webpack_require__ (/*! ./utils.js */ \"./src/utils.js\");\nGame.DIM_X = 1000;\nGame.DIM_Y = 600;\nGame.NUM_ASTEROIDS = 20;\n\nfunction Game(){\n    this.asteroids = [];\n    while (this.asteroids.length < Game.NUM_ASTEROIDS) {\n        this.asteroids.push(this.addAsteroids());\n    }\n}\n\n\n\nGame.prototype.addAsteroids = function(){\n    let options = {\n        pos: this.randomPosition()\n    };   \n    let newAsteroid = new Asteroid(options);\n    return newAsteroid;\n}\n\nGame.prototype.randomPosition = function(){\n    return [Game.DIM_X * Math.random(), Game.DIM_Y * Math.random()];\n}\n\nGame.prototype.draw = function (ctx) {\n    ctx.clearRect(0,0,1000,600)\n    for (let i = 0; i < this.asteroids.length; i++) {\n        this.asteroids[i].draw(ctx);\n    }\n}\n\nGame.prototype.moveObjects = function() {\n    for (let i = 0; i< this.asteroids.length; i++) {\n    this.asteroids[i].move();\n    }\n}\n\n\nmodule.exports = Game;\n\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module, __webpack_require__ */
/*! CommonJS bailout: module.exports is used directly at 18:0-14 */
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\n\n\nfunction GameView(Game, ctx) {\n    this.game = Game;\n    this.ctx = ctx;\n}\n\nGameView.prototype.start = function() {\n    setInterval(function() {\n    this.game.draw(this.ctx);\n    this.game.moveObjects();\n    }, 20);\n}\n\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module */
/***/ ((module) => {

eval("\nfunction MovingObject(options){\n    this.pos = options.pos;\n    this.vel = options.vel;\n    this.radius = options.radius;\n    this.color = options.color;\n}\n\n\nMovingObject.prototype.draw = function(ctx){\n    ctx.beginPath();\n    // (circleCenterX, circleCenterY, radius, startAngle, endAngle, counterclockwise(optional))\n    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);\n    ctx.fillStyle = this.color;\n    ctx.fill(); \n\n}\n\nMovingObject.prototype.move = function(){\n    this.pos[0] = this.pos[0] + this.vel[0];\n    this.pos[1] = this.pos[1] + this.vel[1];\n}\n\n\n\nmodule.exports = MovingObject;\n\n// const mo = new MovingObject({\n//     pos: [30, 30],\n//     vel: [10, 10],\n//     radius: 5,\n//     color: \"#00FF00\"\n// });\n\n\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module */
/***/ ((module) => {

eval("\nconst Util = {\n    inherits (ParentClass, childClass) {\n        function Surrogate() { };\n        Surrogate.prototype = ParentClass.prototype;\n        childClass.prototype = new Surrogate()\n        childClass.prototype.constructor = childClass;\n\n    },\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n  // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n};\n\n\nmodule.exports = Util;\n\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		if(__webpack_module_cache__[moduleId]) {
/******/ 			return __webpack_module_cache__[moduleId].exports;
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
(() => {
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: __webpack_require__ */
eval("console.log(\"Webpack is working!\")\n\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\n\nwindow.addEventListener('DOMContentLoaded', (event) => {\n  const canvas = document.getElementById(\"game-canvas\");\n  const ctx = canvas.getContext('2d');\n  window.MovingObject = MovingObject;\n  window.ctx = ctx;\n  window.Asteroid = Asteroid;\n  window.Game = Game;\n  window.GameView = GameView;\n});\n\n\n\n//event listiner adds listener to webpage for specific event. \n//first arguement is what we are listening for\n//2nd is callback we want invoked when it occurs.\n//?getContext is type of image\n//* this is a pattern we will use often\n\n\n//# sourceURL=webpack:///./src/index.js?");
})();

/******/ })()
;