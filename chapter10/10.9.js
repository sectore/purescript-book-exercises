
// ex.10.9.2:
// First:
// psc-package install arrays
// psc-package build

var Array = require('./output/Data.Array');

console.log(`range: 		${Array.range(0)(24)}`);
console.log(`replicate: ${Array.replicate(19)('a')}`);
console.log(`cons: 			${Array.cons(1)([2,3,4])}`);
console.log(`head: 			${Array.head([2,3,4])}`);
console.log(`null: 			${Array.null([])}`);
