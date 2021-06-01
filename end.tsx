import {readLines} from "https://deno.land/std@0.97.0/io/bufio.ts";

interface Region {
  name: string;
  population: number;
  southEdge: number;
}

async function tally(file: Deno.File, regions: Region[]) {
  // Tally.
  for await (const line of readLines(file)) {
    const fields = line.split("\t");
    const latitude = Number(fields[4]);
    const population = Number(fields[14]);
    regions: for (const region of regions) {
      if (latitude >= region.southEdge) {
        region.population += population;
        break regions;
      }
    }
  }
  // Report.
  for (const region of regions) {
    console.log(`${region.name}: ${region.population}`);
    // <div><span>hi</span></div>;
  }
}

async function main() {
  const file = await Deno.open(Deno.args[0]);
  try {
    const regions = [
      {name: "North", population: 0, southEdge: 0},
      {name: "South", population: 0, southEdge: -90},
    ] as Region[];
    await tally(file, regions);
  } finally {
    file.close();
  }
}

declare global {
  namespace JSX {
    interface IntrinsicElements {
      [elemName: string]: unknown;
    }
  }
  let React: unknown;
}

main();
