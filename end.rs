use std::io::BufRead;

type Result<T> = std::result::Result<T, Box<dyn std::error::Error>>;

struct Region {
    name: String,
    population: i64,
    south_edge: f64,
}

fn tally(file: std::fs::File, regions: &mut Vec<Region>) -> Result<()> {
    // Tally.
    for maybe_line in std::io::BufReader::new(file).lines() {
        let line = maybe_line?;
        let fields: Vec<&str> = line.split("\t").collect();
        let latitude = fields[4].parse::<f64>()?;
        let population = fields[14].parse::<i64>()?;
        for region in regions.into_iter() {
            if latitude >= region.south_edge {
                region.population += population;
                break;
            }
        }
    }
    // Report.
    for region in regions.into_iter() {
        println!("{}: {}", region.name, region.population);
    }
    Ok(())
}

fn main() -> Result<()> {
    let args: Vec<String> = std::env::args().collect();
    // dbg!(args);
    let file = std::fs::File::open(&args[1])?;
    let mut regions = vec![
        Region {
            name: "North".to_string(),
            population: 0,
            south_edge: 0.0,
        },
        Region {
            name: "South".to_string(),
            population: 0,
            south_edge: -90.0,
        },
    ];
    tally(file, &mut regions)
}
