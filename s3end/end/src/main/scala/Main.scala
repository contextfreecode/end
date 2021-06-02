import scala.util.control.Breaks._

class Region(
  val name: String,
  population: Long,
  val southEdge: Double,
)

def tally(file: scala.io.Source) =
  breakable {
    for (line <- file.getLines)
      val fields = line.split('\t')
      println(fields.length)
      break
  }

@main def hello(name: String): Unit =
  scala.util.Using(scala.io.Source.fromFile(name)) { file =>
    val regions = List(
      Region(name = "North", population = 0, southEdge = 0),
      Region(name = "South", population = 0, southEdge = -90),
    )
    tally(file)
  }
