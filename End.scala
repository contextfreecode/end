import scala.util.control.Breaks._

class Region(
  val name: String,
  var population: Long,
  val southEdge: Double,
)

def tally(file: scala.io.Source, regions: Iterable[Region]): Unit =
  for (line <- file.getLines)
    val fields = line.split('\t')
    val latitude = fields(4).toDouble
    val population = fields(14).toLong
    breakable {
      for (region <- regions)
        if latitude >= region.southEdge then
          region.population += population
          break
        end if
      end for
    }
  end for
end tally

@main def hello(name: String): Unit =
  val regions = List(
    Region(name = "North", population = 0, southEdge = 0),
    Region(name = "South", population = 0, southEdge = -90),
  )
  scala.util.Using(scala.io.Source.fromFile(name)) { file =>
    tally(file, regions)
  }
  for (region <- regions)
    println(s"${region.name}: ${region.population}")
  end for
end hello
