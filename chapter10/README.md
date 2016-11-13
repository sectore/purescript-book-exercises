# Chapter 10: "The Foreign Function Interface"

## 10.9. ([10.9.js](./10.9.js))

1. (Easy) What are the runtime representations of these types?

```purescript
forall a. a
forall a. a -> a -> a
forall a. Ord a => Array a -> Boolean
```

What can you say about the expressions which have these types?

2. (Medium) Try using the functions defined in the purescript-arrays package, calling them from JavaScript, by compiling the library using pulp build and importing modules using the require function in NodeJS. Hint: you may need to configure the output path so that the generated CommonJS modules are available on the NodeJS module path.


## 10.15. ([10.15.js](./10.15.js) / [10.15.purs](./10.15.purs))

1. (Medium) Write a wrapper for the `confirm` method on the JavaScript `Window` object, and add your foreign function to the `Control.Monad.Eff.Alert` module.

2. (Medium) Write a wrapper for the `removeItem` method on the `localStorage` object, and add your foreign function to the `Control.Monad.Eff.Storage` module.
