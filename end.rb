Region = Struct.new(:name, :population, :south_edge, keyword_init: true)

def tally(file, regions)
  file.each do |line|
    fields = line.split("\t")
    latitude = fields[4].to_f
    population = fields[14].to_i
    regions.each do |region|
      if latitude >= region.south_edge
        region.population += population
        break
      end
    end
  end
end

def main
  regions = [
    Region.new(name: "North", population: 0, south_edge: 0),
    Region.new(name: "South", population: 0, south_edge: -90),
  ]
  File.open(ARGV[0]) do |file|
    tally(file, regions)
  end
  regions.each do |region|
    puts "#{region.name}: #{region.population}"
  end
end

main
