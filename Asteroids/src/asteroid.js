const MovingObject = require ('./moving_object.js');
const Util = require ('./utils.js');

const DEFAULT = {
    color: "DFFF00",
    radius: 20
}

function Asteroid(options) {
    // this.pos = options.pos; 
    options.vel = Util.randomVec(4)
    options.color = DEFAULT.color;
    options.radius = DEFAULT.radius;
    MovingObject.call(this, options);

}
Util.inherits(MovingObject, Asteroid);
module.exports = Asteroid;