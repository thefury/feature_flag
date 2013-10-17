# FeatureFlag

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'feature_flag'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install feature_flag

## Usage

### Executing code based on feature

    FeatureFlag::Toggle.when_active(:featurename) do
      # feature code here
    end

### Testing if a feature is active

    FeatureFlag::Toggle.active?(:featurename)

### Ensuring a feature is active

    FeatureFlag::Toggle.require(:featurename)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
