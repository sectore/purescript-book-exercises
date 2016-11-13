
//
// ex 10.9.1

// forall a. a
exports.any = () => 'any-return-value';
// forall a. a -> a -> a
exports.anymore = (a) => (b) => `any-return-${a}-${b}`;
// forall a. Ord a => Array a -> Boolean
exports.anyOrd = (dict) => (arr) => true // (e.g. arr.length === 0);


// ex.10.9.2:
// Run
// psc-package install arrays
// psc-package build
// node ./10.9.js

var Array = require('./output/Data.Array');

console.log(`range: ${Array.range(0)(24)}`);
console.log(`replicate: ${Array.replicate(19)('a')}`);
console.log(`cons: ${Array.cons(1)([2,3,4])}`);
console.log(`head: ${Array.head([2,3,4])}`);
console.log(`null: ${Array.null([])}`);
