# SimpleToggle
    
TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'simple_toggle'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_toggle

## Migration

    $ rails generate simple_toggle:install
    $ rake db:migrate

## Usage

### Executing code based on feature

    SimpleToggle::Toggle.when_active(:featurename) do
      # feature code here
    end

### Testing if a feature is active

    SimpleToggle::Toggle.active?(:featurename)

### Ensuring a feature is active

    SimpleToggle::Toggle.require(:featurename)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
