console.log("Webpack is working!")

const MovingObject = require('./moving_object.js');
const Asteroid = require('./asteroid.js');
const Game = require('./game.js');
const GameView = require('./game_view.js');

window.addEventListener('DOMContentLoaded', (event) => {
  const canvas = document.getElementById("game-canvas");
  const ctx = canvas.getContext('2d');
  window.MovingObject = MovingObject;
  window.ctx = ctx;
  window.Asteroid = Asteroid;
  window.Game = Game;
  window.GameView = GameView;
});



//event listiner adds listener to webpage for specific event. 
//first arguement is what we are listening for
//2nd is callback we want invoked when it occurs.
//?getContext is type of image
//* this is a pattern we will use often
