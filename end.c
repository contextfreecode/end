#include <stddef.h>
#include <stdio.h>

typedef struct Place {
  const char* name;
  int population;
} Place;

const Place places[] = {
  {.name = "Río Blanco", .population = 829},
  {.name = "San Marcos", .population = 47063},
  {.name = "Xela", .population = 180706},
};

int main() {
  size_t places_length = sizeof(places) / sizeof(*places);
  const Place* places_end = places + places_length;
  for (const Place* place = places; place < places_end; ++place) {
    int population = place->population;
    const char* category;
    if (population < 5000) {
      category = "village";
    } else if (population < 100000) {
      category = "town";
    } else {
      category = "city";
    }
    printf("%s: %s\n", place->name, category);
  }
}
