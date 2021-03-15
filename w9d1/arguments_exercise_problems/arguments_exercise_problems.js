// function sum () {
//   let sum = 0; 
//   Array.from(arguments).forEach(ele => sum += ele);
//   return sum;  
// }

// function sum (...arguments) {
//   let sum = 0;
//   arguments.forEach(ele => sum += ele);
//   return sum;
// }



// console.log(sum(1, 2, 3, 4));
// console.log(sum(1, 2, 3, 4, 5));

Function.prototype.myBind = function (context, ...bindArguments) {
  return (...callArguments) => {
    return this.apply(context, bindArguments.concat(callArguments));
  }
}


Function.prototype.myBind = function (context) {
  const args = Array.from(arguments).slice(1);
  let that = this
  return function() {
    return that.apply(context, args.concat(Array.from(arguments)));
  }
}

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");




const curriedSum = function(numArgs) {
  let numbers = [];
  const _curriedSum = function(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return numbers.reduce((accumulator, num) => accumulator + num);
    } else {
      return _curriedSum
    }
  }
  return _curriedSum
}

const sum = curriedSum(5);
console.log(sum(5)(30)(20)(1)(2)); // => 56


