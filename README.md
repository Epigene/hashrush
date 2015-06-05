# Hashrush

Extends Ruby Hash class with the `.build_from_symbol_variables` method.  
Use when building hashes from pre-loaded variables to avoid repetiton.
(binding, *args)

## Installation

`gem 'hashrush'` and `bundle`

## Usage

You might be familiar with making hashes like so:

```ruby
# Pre-load values, trivialized here
name = @user.name
age = @user.age

# Build hash
hash = {name: name, age: age}

# Use hash in new object instantiation
@view_variable = GemNamespace::Class.new(hash)
```

Hashrush shortens step 2. Use like this:

```ruby
# Pre-load values, trivialized here
name = @user.name
age = @user.age

# Build hash
hash = Hash.build_from_symbol_variables(binding, :name, :age)

# Use hash in new object instantiation
@view_variable = GemNamespace::Class.new(hash)
```

Since `binding.eval` is used, the binding object must be passed exlicitly as the first argument, sorry.
