# bootstrap-on

Padrino admin generators with Twitter Bootstrap integration


## Installation

```
gem install bootstrap-on
```

In a Gemfile:

```ruby
gem 'bootstrap-on', :group => :development
```

Padrino gotcha: You'll need to put the `gem 'bootstrap-on'` requirement in your Gemfile *after* `gem 'padrino'` as it depends on Padrino being loaded so it can attach itself to the Padrino generators.


## Usage

### Bootstrapped Admin Generator

Generates a new Padrino Admin application with Twitter Bootstrapped integrated.

**Command:**

```
padrino g bs_admin
```

**Options:**

-r, [--root=ROOT] The root destination. Default: .

-s, [--skip-migration]

-d, [--destroy]

-e, [--renderer=RENDERER] Rendering engine (erb, haml or slim)

-m, [--admin-model=ADMIN_MODEL] The name of model for access controlling. Default: Account

-a, [--app=APP] The model destination path. Default: .

**Example:**

```
padrino g bs_admin
```

### Bootstrapped Admin Page Generator

Generates a new Padrino Admin page with Twitter Bootstrapped integrated.

**Command:**

```
padrino g bs_admin_page [model]
```

**Options:**

-r, [--root=ROOT] The root destination.

-s, [--skip-migration]

-d, [--destroy]

**Example:**

```
padrino g bs_admin_page product
```


## To Do List

* Format haml and slim templates


## Contributing to bootstrap-on

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.


## Copyright

Copyright (c) 2012 [Stuart Chinery](http://www.headlondon.com/who-we-are#stuart-chinery) and [Dave Hrycyszyn](http://www.headlondon.com/who-we-are#david-hrycyszyn) - [headlondon.com](http://www.headlondon.com)

See LICENSE.txt for further details.