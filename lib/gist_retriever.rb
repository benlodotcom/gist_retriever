require "gist_retriever/version"
require "open-uri"

module GistRetriever
	class Retriever

		class << self
    		attr_accessor :default_language, :gist_base_url, :gist_regex
  		end

  		self.default_language = 'c'
  		self.gist_base_url = "https://gist.github.com/"
  		#We set up the regexp we want to find in the string and replace it by the highlighted code
  		    #This regular expression detects the code used to emebed a gist and extract the id of the gist,
  		    #the file (for a multifile gist) and the language (the language attribute has to be added to the
  		    #embed code)
		  self.gist_regex = /<script src=\"(http|https):\/\/gist.github.com\/(\d+).js(\?file=(\S+))?\"(\s*lang=\"(.+)\")?>\s*<\/script>/

  		def get_gist_url(gist_base_url, gist_id)
  		  #complete gist url
  		  "#{gist_base_url}#{gist_id}"
  		end

  		def get_gist_raw_url(gist_base_url, gist_id, gist_file)

  		    #url to the text version of the gist (two versions depending if we show only one file or all the gist)
  		    if (!gist_file.nil?) 
  		      "#{gist_base_url}raw/#{gist_id}/#{gist_file}"
  		    else
  		      "#{get_gist_url(gist_base_url,gist_id)}.txt"
  		    end
  		end

  		def get_gist_code(gist_raw_url)
  			URI.parse(gist_raw_url).read
  		end

  		def go_fetch(text, &block)
  		    
  		    text.gsub(self.class.gist_regex) do
  		    	gist_id = $2
  		    	gist_file = $4
  		    	gist_lang = $6 || self.class.default_language
  		    	#complete gist url
  		    	gist_url = get_gist_url(self.class.gist_base_url, gist_id)
  		    	#url to the text version of the gist (two versions depending if we show only one file or all the gist)
  		    	gist_raw_url = get_gist_raw_url(self.class.gist_base_url, gist_id, gist_file)
  		    	#get gist raw code from github
  		    	gist_code = get_gist_code(gist_raw_url)

  		    	yield gist_code, gist_lang, gist_id, gist_file, gist_url, gist_raw_url
  		    end
  		end


	end
end