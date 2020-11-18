const Asteroid = require ('./asteroid.js');
const Util = require ('./utils.js');
Game.DIM_X = 1000;
Game.DIM_Y = 600;
Game.NUM_ASTEROIDS = 20;

function Game(){
    this.asteroids = [];
    while (this.asteroids.length < Game.NUM_ASTEROIDS) {
        this.asteroids.push(this.addAsteroids());
    }
}



Game.prototype.addAsteroids = function(){
    let options = {
        pos: this.randomPosition()
    };   
    let newAsteroid = new Asteroid(options);
    return newAsteroid;
}

Game.prototype.randomPosition = function(){
    return [Game.DIM_X * Math.random(), Game.DIM_Y * Math.random()];
}

Game.prototype.draw = function (ctx) {
    ctx.clearRect(0,0,1000,600)
    for (let i = 0; i < this.asteroids.length; i++) {
        this.asteroids[i].draw(ctx);
    }
}

Game.prototype.moveObjects = function() {
    for (let i = 0; i< this.asteroids.length; i++) {
    this.asteroids[i].move();
    }
}


module.exports = Game;
