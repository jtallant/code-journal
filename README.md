# Code Journal

This repo is where I post solutions to programming problems and play around with different languages and libraries.

## Ruby/obfuscate 3/15/2013
Write the following methods:
"obfuscate" returns the string with all words from the list obfuscated.
```ruby
obfuscate("big string of big words is bigger", ["big", "words"]) 
# => "*** string of *** ***** is bigger"
```
"report" returns a hash that contains the list of words and their associated frequency in the string.
```ruby
report("big string of big words is bigger", ["big", "words"]) 
# => {"big" => 2, "words" => 1}
```