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


## PHP/blog_topic_picker 3/15/2013
I have a list of things I want to blog about that is always growing. The problem is that by the time I'm ready to write a blog post, I can't decide which topic to write about so I don't write at all. I'm puttng this file on my webserver and visiting it every week. Whatever topic pops up is the one I write about that week.

The blog topic picker is simple. It uses a text file as a database. You can optionally restrict access to only your IP address.