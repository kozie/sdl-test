#include "vector.h"
#include <cstdio>

Vector::Vector()
{
  printf("Constructing new Vector\n");
}

Vector Vector::operator+(const Vector& v) const
{
  return Vector(x + v.x, y + v.y);
}
