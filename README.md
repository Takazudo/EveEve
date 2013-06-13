# EveEve

event module

## Demos

* [Basic](http://takazudo.github.io/EveEve/demos/)

## Usage

```javascript
var ev = new EveEve;
ev.on('foo', function(data) {
  console.log('foo!', data.prop);
});
ev.trigger('foo', {
  prop: 'val'
});
```

## License

Copyright (c) 2013 "Takazudo" Takeshi Takatsudo  
Licensed under the MIT license.

## Build

Use

 * [CoffeeScript][coffeescript]
 * [grunt][grunt]

[coffeescript]: http://coffeescript.org "CoffeeScript"
[grunt]: http://gruntjs.com "grunt"
