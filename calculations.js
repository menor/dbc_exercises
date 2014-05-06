/*
 
Write four functions:  sum, mean, and median.  Each accepts an array
and returns its respective calculation.
 
Below you will find driver code. Run the code in this file either from the command line
using Node.js or by pasting the code of this entire file into your
browser console.  All tests will log 'true' in the console when
they pass--false, otherwise.
 
I would encourage you to let the tests guide your work.  Code has been
provided to pass the first test.  The next step would be to make the
second test pass, and so on--sometimes your solution might result
in multiple tests passing.
 
*/
 
 
// __________________________________________
// Write your code below.
 
 
var sum = function(numbers) {
  var sum = 0;
  for (var i in numbers) {
    sum += numbers[i];
  }
  return sum;
};

var mean = function(numbers) {
  return sum(numbers)/numbers.length;
};

var median = function(numbers) {
  var sorted = numbers.sort(function(a, b) {
    return a - b; // If we don't pass a function sort sorts alphabetically
  });
  var length = numbers.length;
    if (length % 2 === 0) { // If the array is even
      var central_number_1 = numbers[length/2 - 1];
      var central_number_2 = numbers[length/2];
      return (central_number_1 + central_number_2) / 2;
  } else { // If the array is odd
    return numbers[(length/2) - 0.5];
  }
};
  
 
// __________________________________________
// Driver Code:  Do not alter code below this line.
 
 
oddLengthArray  = [1, 2, 3, 4, 5, 5, 7];
evenLengthArray = [4, 4, 5, 5, 6, 6, 6, 7];
 
 
function assert(test, message, test_number) {
  if (!test) {
    console.log(test_number + "false");
    throw "ERROR: " + message;
  }
  console.log(test_number + "true");
  return true;
}
 
// tests for sum
assert(
  (sum instanceof Function),
  "sum should be a Function.",
  "1. "
);
 
assert(
  sum(oddLengthArray) === 27,
  "sum should return the sum of all elements in an array with an odd length.",
  "2. "
);
 
assert(
  sum(evenLengthArray) === 43,
  "sum should return the sum of all elements in an array with an even length.",
  "3. "
);
 
// tests for mean
assert(
  (mean instanceof Function),
  "mean should be a Function.",
  "4. "
);
 
assert(
  mean(oddLengthArray) === 3.857142857142857,
  "mean should return the average of all elements in an array with an odd length.",
  "5. "
);
 
assert(
  mean(evenLengthArray) === 5.375,
  "mean should return the average of all elements in an array with an even length.",
  "6. "
);
 
// tests for median
assert(
  (median instanceof Function),
  "median should be a Function.",
  "7. "
);
 
assert(
  median(oddLengthArray) === 4,
  "median should return the median value of all elements in an array with an odd length.",
  "8. "
);
 
assert(
  median(evenLengthArray) === 5.5,
  "median should return the median value of all elements in an array with an even length.",
  "9. "
);