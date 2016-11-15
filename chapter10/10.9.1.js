
// Exercise:
// (Easy) What are the runtime representations of these types?
//
// ```purescript
// forall a. a
// forall a. a -> a -> a
// forall a. Ord a => Array a -> Boolean
// ```
//
// What can you say about the expressions which have these types?

// forall a. a
exports.any = () => 'any-return-value';
// forall a. a -> a -> a
exports.anymore = (a) => (b) => `any-return-${a}-${b}`;
// forall a. Ord a => Array a -> Boolean
exports.anyOrd = (dict) => (arr) => true // (e.g. arr.length === 0);
