What follows is a set of recommendations used for naming objects with MiddleClass. These are completely optional, but will be used in all the modules directly dependent on MiddleClass (such as the "Stateful":https://github.com/kikito/stateful.lua module)

h2. Classes and packages

* Package names should be lowercased and separated by underscores: package_name
* Class names & mixin names should begin with Uppercase, and use camelCase notation: MyClass, MyMixin
* One exception to this rule is when classes are declared inside packages in that case, they can be declared as follows: 
```lua
  MyClass = class('package.MyClass')
```
* Another exception is for internal classes (classed declared inside classes) 
```lua
MyClass = class('package.MyClass')
MyClass.InternalClass = class('package.MyClass.InternalClass')
```

h2. Attributes, instances and constants

* Attributes begin with lowercase, and use camelCase: MyClass.attributeOne, MyClass.attributeTwo
** An underscore can precede the initial lowercase if the attribute is supposed to be private: MyClass._privateAttribute 
* Variables pointing to instances of classes should start with lowercase and be camelCased: myInstance = MyClass:new()
* Constants should be ALL_UPPERCASED, and use underscores for word separations: MyClass.MY_CONSTANT
* Private attributes should be preceded with an underscore: _myPrivateAttribute 

h2. Methods

* Methods should begin with lowercase, and use camelCase: MyClass.myMethod
* When possible, methods should use explicit verbs: getX() instead of x()
* Instance methods should be declared using the colons, so they have an implicit 'self' parameter: 
```lua
  function MyClass:setX(x)
    self.x = x
  end
```
* Class methods should use the special property 'static' for being defined:
```lua
function MyClass.static:classMethod()
  print('I am the ' .. self.name .. ' class. I am awesome')
end
```
* Private methods should be preceded with an underscore: @_myPrivateMethod@

h2. File names

* In general, filenames will be named using hyphens and lowercase letters: my-file-name.lua
* Folders containing a package should be called the same way as the package itself: my_package should be stored under a folder called /my_package/
* If a file only defines a class, it should be named like the class. It's recommended to use under_scored names instead of CamelCased names in files, even if they only contain a class: a class named MyClass should be defined on a file named my_class.lua
* Same happens with Mixins: the file defining MyMixin should be called my_mixin.lua
* If a class is so big it needs to be split on several files, precede all the files defining this class with the class name, followed by an underscore and an explanation of what the file defines: 
```lua
  game.lua
  game_main_menu.lua
  game_options_menu.lua
  game_play.lua
```