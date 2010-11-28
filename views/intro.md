## Introduction

### What

Sammy.js is a tiny JavaScript framework developed to ease the pain and provide a basic structure for developing JavaScript applications.

Sammy tries to achieve this by providing a small 'core' framework and an evergrowing list of plugins for specific functionality. The core includes a simple API for defining applications which are made up primarily of `routes` and `events`. By driving application development around a small and specific API, Sammy attempts to keep your code organized while still allowing a lot of breathing room to define your own style and structure. 

Sammy *is not* a solution for every JavaScript application or problematic situation. It is a single and rather opinionated method for building applications that tries to lend itself to best practices and maintainable development. It does this without the overhead of a large base framework or a single method or system for building models or views. If you want something more fully featured I highly suggest checking out [SproutCore](http://www.sproutcore.com) or [Cappucino](http://cappucino.org).

### Why

In the modern age of super fast browsers and user expectations about the responsiveness and perceived speed of web applications - single page AJAX applications have become the rage (GMail, etc). Furthermore, instead of just fetching full HTML and rendering it asynchronously, fetching raw data (JSON) and rendering on the client side has not only become possible - its actually very common. 

Sammy.js was originally built as an experiment in desigining API's in Javascript and was heavily inspired by [Sinatra.rb](http://www.sinatrarb.com). As Sammy evolved it aimed to solve the common problems associated with writing this new style of application. It became clear early on that Sammy was well suited for building simple applications on top of RESTful JSON data stores ([See CouchDB](http://www.quirkey.com/blog/2009/09/15/sammy-js-couchdb-and-the-new-web-architecture/)). 

Sammy continues to be fueled by the community and real world production applications. It's small enough that it can stay out of your way, and now in the latest version it can integrate with the DOM/AJAX Framework of your choice.

### How

#### Installation

[Download Sammy.js](/download) and install it in your public javascripts directory.
Include it in your document AFTER jQuery. For more detailed instructions, [check out the first tutorial](/docs/tutorials/json_store/1)

#### Basic Usage 


### More!

### Learn!

* [Docs](http://code.quirkey.com/sammy/docs/)
* [Examples](http://github.com/quirkey/sammy/tree/master/examples/)
* [More Resources on the Sammy Wiki](http://github.com/quirkey/sammy/wiki/)

### Keep informed!

* [Follow @sammy_js](http://twitter.com/sammy_js)
* [Join the mailing list](http://groups.google.com/group/sammyjs)
* [Chat with us in #sammy](irc://irc.freenode.net/#sammy)

