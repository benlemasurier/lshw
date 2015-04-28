# Lshw

[![Build Status](https://travis-ci.org/benlemasurier/lshw.svg)](https://travis-ci.org/benlemasurier/lshw)

A ruby gem for easy access to `lshw -xml` output.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lshw'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lshw

## Usage


```ruby
f = File.open('lshw-output.xml')
hw = Lshw::XML(f)
f.close

hw.cpus.length
=> 2

hw.cpus.first.bits
=> 64

hw.memory[:size]
=> 137438953472

```
