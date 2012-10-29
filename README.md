# GistRetriever

This gem provides you with a nice and easy way to replace gist embed codes by the gist content, giving you the ability to do whatever you want to do with the content of the gist, including:
* Use another highlight theme than the ones provided by github.
* Being more SEO friendly as the code is not embeded in javascript.
* ...

## Installation

Add this line to your application's Gemfile:

    gem 'gist_retriever'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gist_retriever

## Usage

Given you have some text containing gist embed codes.

```
text = %q{Some text before <script src="https://gist.github.com/3486602.js"> </script> Some text after}"
```
For each gist embed codes you can add an optional lang attribute to specify the language of the gist, otherwise the default language will be used.
```
text = %q{Some text before <script lang="js" src="https://gist.github.com/3486602.js"> </script> Some text after}
```

gist_retriever provides you with a nice block based syntax to detect gist embed codes and retrieve the following infos:
* gist_code => The gist content in plain text
* gist_lang => The language of the gist (default language is C if nothing specified in the lang attribute of the gist)
* gist_id => The github id of the gist
* gist_file => The name of the gist if it is defined
* gist_url => The url of the gist
* gist_raw_url => The url to the raw content of the gist

### Scan text for embed codes and retrieve corresponding gist informations
```
GistRetriever::Retriever.new.fetch_and_replace(text) do |gist_code, gist_lang, gist_id, gist_file, gist_url, gist_raw_url|
	#Do whatever you want to do with the infos.
end
```
### Replace the gist embed code by the plaintext content of the gist
```
GistRetriever::Retriever.new.fetch_and_replace(text) do |gist_code, gist_lang, gist_id, gist_file, gist_url, gist_raw_url|
	gist_code
end
```

### Replace gist embed code with custom higlighted code
In this example I use redcarpet along with pygments.rb to highlight code.

```
def gists_to_md(text)
      GistRetriever::Retriever.new.fetch_and_replace(text) do |gist_code, gist_lang, gist_id, gist_file, gist_url, gist_raw_url|
        gist_file ||= "Gist"
        md = "\n``` #{gist_lang} \n#{gist_code}\n```\n[#{gist_file}](#{gist_url}) - [Raw code](#{gist_raw_url})"
      end
      
    end
```

The gist embed code is replaced by a Markdown code block with the plaintext content of the gist and two links to acces the gist and its raw content on github.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## TODO
1. Add a method to retrieve data only and not substitute
2. Add language detection by file extension
