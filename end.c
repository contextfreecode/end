#include <assert.h>
#include <stddef.h>
#include <stdio.h>

// typedef struct Place {
//   const char* name;
//   int population;
// } Place;

// const Place places[] = {
//   {.name = "Río Blanco", .population = 829},
//   {.name = "San Marcos", .population = 47063},
//   {.name = "Xela", .population = 180706},
// };

int main(int argc, const char** argv) {
  // size_t places_length = sizeof(places) / sizeof(*places);
  // const Place* places_end = places + places_length;
  // for (const Place* place = places; place < places_end; ++place) {
  //   int population = place->population;
  //   const char* category;
  //   if (population < 5000) {
  //     category = "village";
  //   } else if (population < 100000) {
  //     category = "town";
  //   } else {
  //     category = "city";
  //   }
  //   printf("%s: %s\n", place->name, category);
  // }
  assert(argc >= 2);
  // const char* pattern =
  //   "%*[^\t]\t%*[^\t]\t%*[^\t]\t%*[^\t]\t%lf\t%lf%*[^\n]";
  // const char* pattern =
  //   "%*[^\t]\t%*[^\t]\t%*[^\t]\t%*[^\t]\t%lf\t%lf\t"
  //   "%*[^\t]\t%*[^\t]\t%*[^\t]\t%*[^\t]\t%d%*[^\n]";
  FILE* file = fopen(argv[1], "r");
  double latitude;
  double longitude;
  int population;
  char buffer[4096];
  while (fgets(buffer, sizeof buffer, file)) {
    printf("--- %s\n", buffer);
    // if (fscanf(file, pattern, &latitude, &longitude, &population)) {
    // // if (fscanf(file, pattern, &latitude, &longitude)) {
    //   // printf("%f %f\n", latitude, longitude);
    //   printf("%f %f %d\n", latitude, longitude, population);
    // }
    break;
  }
}
