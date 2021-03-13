const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {
    reader.question('Give a number', function(str) {
      let parsed = parseInt(str);
      console.log(sum += parsed);
      addNumbers(sum, numsLeft - 1, completionCallback)
    });
  } else {
    (completionCallback(sum))
  };
};

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
addNumbers(0, 3, function(sum) {
  console.log(`Total Sum: ${sum}`)
});

// rl.question('What do you think of Node.js? ', (answer) => {
//   // TODO: Log the answer in a database
//   console.log(`Thank you for your valuable feedback: ${answer}`);

// rl.close();