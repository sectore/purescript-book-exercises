
//
// ex 10.15.1
exports.confirm = (msg) => () => window.confirm(msg);

//
// ex. 10.15.2
exports.getItem = (key) => () => window.localStorage.removeItem(key);
