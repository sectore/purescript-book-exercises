# Chapter 10: "The Foreign Function Interface"

## [10.9.](./10.9.js)

1. (1. (Easy) What are the runtime representations of these types?

```purescript
forall a. a
forall a. a -> a -> a
forall a. Ord a => Array a -> Boolean
```

What can you say about the expressions which have these types?

2. (Medium) Try using the functions defined in the purescript-arrays package, calling them from JavaScript, by compiling the library using pulp build and importing modules using the require function in NodeJS. Hint: you may need to configure the output path so that the generated CommonJS modules are available on the NodeJS module path.
