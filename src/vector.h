#ifndef _vector_h_
#define _vector_h_

class Vector {
public:
  double x, y;
  double angle;

  double len;

  Vector();
  Vector(double x, double y) :
    x(x), y(y) { }

  Vector(double x, double y, double angle) :
    x(x), y(y), angle(angle) { }

  Vector operator+(const Vector& v) const;

  ~Vector() { }
};

#endif
