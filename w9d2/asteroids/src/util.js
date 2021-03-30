const Util = {
  inherits(childClass, parentClass) { // Don't need 'function' keyword when replacing it with the function name
    function Surrogate() { };
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate();
    childClass.prototype.constructor = childClass;
  },
  randomVec(length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },
  scale(vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
};

const getRandomVec = {
  randomVec(length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },
  // Scale the length of a vector by the given amount.
  scale(vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
};

// Util.inherits = function (childClass, parentClass) {

//   function Surrogate() { };
//   Surrogate.prototype = parentClass.prototype;
//   childClass.prototype = new Surrogate();
//   childClass.prototype.constructor = childClass;
// };

module.exports = Util;