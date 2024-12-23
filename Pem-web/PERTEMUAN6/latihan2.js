// Arithmetic Operators
let sum = 10 + 5; //addition
let difference = 10 - 5; //subtraction
let product = 10 * 5; //multiplication
let quotient = 10 / 5; //division
let reminder = 3 % 2; //modulo
let exponent = 10 ** 5; //exponent
console.log(sum, difference, product, quotient, reminder, exponent);

// Comparison Operators
let isEqual = 5 === "5"; //  sm dg 3 ->Strict Equality
let isEqual2 = 5 == "5"; // sm dg ada 2 -> Not Strict
let isNotEqual = 10 != "10"; //sama dengan ada 1 -> Strick
let isNotEqual2 = 10 !== "10"; //sama dengan ada 2 -> Not Strick
let isGreaterThan = 15 > 10;
console.log(isEqual, isEqual2, isNotEqual, isNotEqual2, isGreaterThan);

// Logical Operators
let hours = 11;
let isBothTrue = hours > 24.0 && true;
let isBothTrue2 = true && false;
let isEitherTrue = true || false;
let isEitherTrue2 = true || true;
let isEitherTrue3 = false || false;
let isNotTrue = !true;
let isNotFalse = !false;
console.log(
  isBothTrue,
  isBothTrue2,
  isEitherTrue,
  isEitherTrue2,
  isEitherTrue3,
  isNotTrue,
  isNotFalse
);
