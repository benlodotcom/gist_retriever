require 'test/unit'
require 'gist_retriever'

class GistRetrieverTest < Test::Unit::TestCase

  def setup
    @retriever = GistRetriever::Retriever.new
    @test_string = %q{Some text before \n <script src="https://gist.github.com/3486602.js"> </script> \n Some text after}
  	@expected_code = %q{int main(int argc, char **argv) {printf(\"Hello you :-)\"; return 0;}}
  end

  def test_fetch_and_replace
	string_with_gists_replaced = @retriever.fetch_and_replace(@test_string) do |gist_code, gist_id, gist_file, gist_url, gist_raw_url|
  		gist_code
  	end
  	assert_not_nil(string_with_gists_replaced.index(@expected_code), "The gist embed code was not replaced correctly")
  end

  def test_fetch
	@retriever.fetch_and_replace(@test_string) do |gist_code, gist_id, gist_file, gist_url, gist_raw_url|
  		assert_equal(@expected_code, gist_code, "The gist code retrieved is not the right one")
  	end
  end

end