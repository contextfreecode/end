function main() {
  const places = [
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

  places.forEach((place) => {
    const population = place.population;
    let category: string;
    if (population < 5_000) {
      category = "village";
    } else if (population < 100_000) {
      category = "town";
    } else {
      category = "city";
    }
    console.log(`${place.name}: ${category}`);
  });
}

main();
