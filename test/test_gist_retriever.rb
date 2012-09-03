require 'test/unit'
require 'gist_retriever'

class GistRetrieverTest < Test::Unit::TestCase

  def test_go_fetch
  	retriever = GistRetriever::Retriever.new
  	testString = 'Some text before \n <script src="https://gist.github.com/3486602.js"> </script> \n Some text after'
  	expectedCode = 'int main(int argc, char **argv) {printf("Hello you :-)"; return 0;}'
  	retriever.go_fetch(testString) do |gist_code, gist_id, gist_file, gist_url, gist_raw_url|
  		assert_equal(gist_code, expectedCode)
  	end
  end

end