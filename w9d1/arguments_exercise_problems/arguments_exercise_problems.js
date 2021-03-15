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

// const sum = curriedSum(5);
// console.log(sum(5)(30)(20)(1)(2)); // => 56


Function.prototype.curry = function(numArgs) {
  let args = [];
  // let that = this;
  const _curriedArgs = function(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return that.apply(that, args);
    } else {
      return _curriedArgs;
    };
  };
  return _curriedArgs;
};

function sumThree(num1, num2, num3, num4, num5) {
  return num1 + num2 + num3 + num4 + num5;
}

// let f1 = sumThree.curry(3)
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30
// console.log(f1)
console.log(sumThree.curry(5)(4)(21)(6)(5)(10))

// console.log(sumThree(4, 20, 6)); // == 30

// you'll write `Function#curry`!
// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30

// // or more briefly:
// sumThree.curry(3)(4)(20)(6); // == 30