defmodule End do
  defmodule Region do
    defstruct name: "", population: 0, south_edge: 0
  end

  defp tally(file, regions) do
    file |> IO.stream(:line) |> Enum.reduce(regions, fn(line, regions) ->
      fields = String.split(line, "\t")
      latitude = Enum.at(fields, 4) |> Float.parse() |> elem(0)
      population = Enum.at(fields, 14) |> Integer.parse() |> elem(0)
      regions
      |> Enum.reduce({false, []}, fn(region, {found, regions}) ->
        {found, region} = if not found and latitude >= region.south_edge do
          {true, %{region | population: region.population + population}}
        else
          {found, region}
        end
        {found, regions ++ [region]}
      end)
      |> elem(1)
    end)
  end

  def main do
    regions = [
      %Region{name: "North", south_edge: 0},
      %Region{name: "South", south_edge: -90},
    ]
    {:ok, regions} = File.open(Enum.at(System.argv, 0), [:read], fn(file) ->
      tally(file, regions)
    end)
    regions |> Enum.each(fn(region) ->
      IO.puts("#{region.name}: #{region.population}")
    end)
  end
end

End.main()
