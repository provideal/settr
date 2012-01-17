Settr
=====

Settr is a hierarchical key-value based storage for configuration settings in Rails apps.

Usage
-----

Use 

`rails g settr:install` 

to install settr and modify */config/initializers/settr.rb* to your needs.

The path to settr settings is */settr/settings/settings*.

Check out the dummy app in the test directory (load seed data via `rake db:seed`).
One can access settr settings by e.g. `Settr.collection1.group1.my_setting`.

Authors
-------

* **Torsten Sprenger** – [ts@metaminded.com](mailto:ts@metaminded.com)
* **Peter Horn** – [ph@metaminded.com](mailto:ph@metaminded.com)

Copyright and License
---------------------

Copyright 2012 metaminded UG. Licensed under the MIT License.