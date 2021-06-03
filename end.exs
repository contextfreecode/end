defmodule End do
  defmodule Region do
    defstruct name: "", population: 0, southEdge: 0
  end

  def main do
    IO.puts "Hi!"
    IO.puts inspect(%Region{})
  end
end

End.main
