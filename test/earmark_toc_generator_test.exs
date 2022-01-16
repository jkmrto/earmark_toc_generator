defmodule EarmarkTocGeneratorTest do
  use ExUnit.Case
  doctest EarmarkTocGenerator

  test "table of content is correclty added" do
    header1 = "header1-test"
    header2 = "header2-test"
    markdown = """
    ## #{header1} 

    ### #{header2}
    """

    {:ok, ast_with_toc, _} = EarmarkParser.as_ast(markdown)
      
    [toc| _rest_md] = EarmarkTocGenerator.setup_toc(ast_with_toc)

    [toc_title, h2_header, h3_headers] = children(toc)

    # Check table of contens title 
    assert "h2" == html_tag(toc_title)
    assert "Table Of Contents" == text(toc_title)

    # Check h2_headers
    assert "li" == html_tag(h2_header)
    [h2_header_link] = children(h2_header)
    assert "a" ==  html_tag(h2_header_link)
    assert header1  ==   text(h2_header_link)

    # Check h3_headers
    assert "ul" == html_tag(h3_headers)
    [h3_header_entry] = children(h3_headers)
    assert "li" == html_tag(h3_header_entry)
    [h3_header_link] = children(h3_header_entry)
    assert "a" ==  html_tag(h3_header_link)
    assert header2  ==   text(h3_header_link)
  end

  defp children({_html_tag, _attr, children, _opts}), do: children
  defp html_tag({html_tag, _attr, _childreen, _opts}), do: html_tag
  defp text({_html_tag, _attr, [text], _opts}), do: text
  
end
