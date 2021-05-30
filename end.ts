function main() {
  let places = [
    {
      name: "Nuevo Progreso",
      population: 2_704,
    },
    {
      name: "San Marcos",
      population: 47_063,
    },
    {
      name: "Xela",
      population: 180_706,
    },
  ];

  let categorizedPlaces = places.map((place) => ({
    name: place.name,
    category: (() => {
      let population = place.population;
      if (population < 5_000) return "village";
      if (population < 100_000) return "town";
      return "city";
    })(),
  }));

  console.log(categorizedPlaces);
}

main();
