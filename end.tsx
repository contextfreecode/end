import { readLines } from "https://deno.land/std@0.97.0/io/bufio.ts";

interface Region {
  name: string;
  population: number;
  southEdge: number;
}

async function tally(file: Deno.File, regions: Region[]) {
  for await (const line of readLines(file)) {
    const fields = line.split("\t");
    const latitude = Number(fields[4]);
    const population = Number(fields[14]);
    regions:
    for (const region of regions) {
      if (latitude >= region.southEdge) {
        region.population += population;
        break regions;
      }
    }
  }
}

async function main() {
  const regions: Region[] = [
    { name: "North", population: 0, southEdge: 0 },
    { name: "South", population: 0, southEdge: -90 },
  ];
  // Tally.
  const file = await Deno.open(Deno.args[0]);
  try {
    await tally(file, regions);
  } finally {
    file.close();
  }
  // Report.
  for (const region of regions) {
    console.log(`${region.name}: ${region.population}`);
  }
}

// <div><span>hi</span></div>;

declare global {
  namespace JSX {
    interface IntrinsicElements {
      [elemName: string]: unknown;
    }
  }
  const React: unknown;
}

main();
