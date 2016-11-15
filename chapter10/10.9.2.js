
// Exercise:
// (Medium) Try using the functions defined in the purescript-arrays package, calling them from JavaScript, by compiling the library using pulp build and importing modules using the require function in NodeJS. Hint: you may need to configure the output path so that the generated CommonJS modules are available on the NodeJS module path.

// Run:
// psc-package install arrays
// psc-package build
// node ./10.9.js

var Array = require('./output/Data.Array');

console.log(`range: ${Array.range(0)(24)}`);
console.log(`replicate: ${Array.replicate(19)('a')}`);
console.log(`cons: ${Array.cons(1)([2,3,4])}`);
console.log(`head: ${Array.head([2,3,4])}`);
console.log(`null: ${Array.null([])}`);
