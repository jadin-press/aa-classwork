function sum () {
  let sum = 0; 
  Array.from(arguments).forEach(ele => sum += ele);
  return sum;  
}

function sum (...arguments) {
  let sum = 0;
  arguments.forEach(ele => sum += ele);
  return sum;
}



console.log(sum(1, 2, 3, 4));
console.log(sum(1, 2, 3, 4, 5));

function.prototype.myBind = function (context) {
  return (...arguments) => {
    return this.apply(context, ...arguments);
  }
}