# Lshw

[![Build Status](https://travis-ci.org/benlemasurier/lshw.svg)](https://travis-ci.org/benlemasurier/lshw)
[![Gem Version](https://badge.fury.io/rb/lshw.svg)](http://badge.fury.io/rb/lshw)

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

## Example

```ruby
require 'lshw'

f = File.open('lshw-output.xml')
lshw = Lshw::XML(f)
f.close

# view system disks
lshw.disks.legnth
=> 1
lshw.disks.first.vendor
=> "DELL"

lshw.disks.first.serial
=> "0092ba6d94a166641b00f667d320b782"

# cpu information
lshw.cpus.length
=> 2

lshw.cpus.first.bits
=> 64

# ram
lshw.memory.size
=> 137438953472

lshw.memory.banks.first.size
=> 17179869184

lshw.memory.banks.first.description
=> "DIMM DDR3 Synchronous 1866 MHz (0.5 ns)"

```

