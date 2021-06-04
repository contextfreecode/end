defmodule End do
  defmodule Region do
    defstruct name: "", population: 0, south_edge: 0
  end

  def tally(file, regions) do
    file |> IO.stream(:line) |> Enum.each(fn(line) ->
      fields = String.split(line, "\t")
      latitude = Enum.at(fields, 4) |> Float.parse()
      population = Enum.at(fields, 14) |> Integer.parse()
      region = regions |> Enum.find(fn region ->
        latitude >= region.south_edge
      end)
    end)
  end

  def main do
    regions = [
      %Region{name: "North", south_edge: 0},
      %Region{name: "South", south_edge: -90},
    ]
    {:ok, _} = File.open(Enum.at(System.argv, 0), [:read], fn(file) ->
      tally(file, regions)
    end)
    IO.inspect(regions)
  end
end

End.main()
