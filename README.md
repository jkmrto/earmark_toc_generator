# EarmarkTocGenerator

Table of contents generator for [earmark](https://github.com/pragdave/earmark) AST nodes.

## Usage example: 

```elixir
markdown_str = File.read!(path)
{:ok, ast, []} = EarmarkParser.as_ast(markdown_str)

ast
|> EarmarkTocGenerator.setup_toc()       
|> Earmark.Transform.transform()
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `earmark_toc_generator` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:earmark_toc_generator, git: "https://github.com/jkmrto/earmark_toc_generator"}
  ]
end
```
