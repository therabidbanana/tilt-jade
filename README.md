tilt-jade
---------

A Rails engine that adds simple compiling of Jade templates into client
side functions (similar to how the Sprockets .eco engine
works).

Probably best combined with the jst engine for attaching the compiled
function to the window. 

hello.js.jst.jade:

    h1 Hello #{sayHelloTo}!

hello.js (what sprockets will output):

    (function() {
      this.JST || (this.JST = {});
      this.JST["templates/hello"] = function anonymous(locals, attrs, escape, rethrow) {
      var attrs = jade.attrs, escape = jade.escape, rethrow = jade.rethrow;
      var __ = { lineno: 1, input: "h1 Hello #{sayHelloTo}!\np test\n", filename: "hello.js.jst.jade" };
      try {
      var buf = [];
      with (locals || {}) {
      var interp;
      __.lineno = 1;
      __.lineno = 1;
      buf.push('<h1>Hello to ' + escape((interp = sayHelloTo) == null ? '' : interp) + '!');
      __.lineno = undefined;
      buf.push('</h1>');
      __.lineno = 2;
      buf.push('<p>test');
      __.lineno = undefined;
      buf.push('</p>');
      }
      return buf.join("");
      } catch (err) {
        rethrow(err, __.input, __.filename, __.lineno);
      }
      };
    }).call(this);

Using the JST in your application.js (note it requires the jade
runtime.js before anything else):
  
    //= require tilt-jade/runtime
    //= require hello
    $('body').html(JST['hello']({sayHelloTo: 'World'}))
