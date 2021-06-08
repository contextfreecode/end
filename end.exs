defmodule End do
  defmodule Region do
    defstruct name: "", population: 0, south_edge: 0
  end

  def tally(lines, regions) do
    Enum.reduce(lines, regions, fn line, regions ->
      fields = String.split(line, "\t")
      {latitude, _} = Enum.at(fields, 4) |> Float.parse()
      {population, _} = Enum.at(fields, 14) |> Integer.parse()

      {regions, _} =
        Enum.map_reduce(regions, false, fn
          region, false when latitude >= region.south_edge ->
            {%{region | population: region.population + population}, true}

          region, found? ->
            {region, found?}
        end)

      regions
    end)
  end

  def main do
    regions = [
      %Region{name: "North", south_edge: 0},
      %Region{name: "South", south_edge: -90}
    ]

    [filename] = System.argv()

    File.stream!(filename)
    |> tally(regions)
    |> Enum.each(&IO.puts("#{&1.name}: #{&1.population}"))
  end
end

End.main()
