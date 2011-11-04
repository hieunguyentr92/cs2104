// HENG LOW WEE
// U096901R
// CS2104 Tut 10 Question 2

#include <stdio.h>
#include <stdlib.h>

struct Drawable {
	int scaleFactor;
	void (*draw) (struct Drawable * self);
	void (*scaledDraw) (struct Drawable * self, int factor);
};

void Drawable_draw(struct Drawable * self) {
	printf("Generic drawable object\n");
}

void Drawable_scaledDraw(struct Drawable * self, int factor) {
	self->scaleFactor = factor;
	self->scaledDraw = Drawable_scaledDraw;
	self->scaleFactor = 1;
}

void init_Drawable (struct Drawable * d) {
	d->scaleFactor = 1;
	// set property here
	// set method
	d->draw = Drawable_draw;
	d->scaledDraw = Drawable_scaledDraw;
}

struct Drawable * make_Drawable () {
	struct Drawable * retVal = malloc(sizeof(struct Drawable));
	init_Drawable(retVal);
	return retVal;
};

struct Circle {
	int scaleFactor;
	void (*draw)(struct Drawable * self);
	void (*scaledDraw)(struct Drawable * self, int factor);
	int x;
	int y;
	int radius;
	void (*super_draw) (struct Drawable * self);
};

void Circle_draw(struct Circle *self) {
	printf("Circle with center at (%d,%d) and radius %d\n", self->x, self->y, self->radius);
}

void init_Circle(struct Circle *self, int x, int y, int radius) {
	init_Drawable(self);
	// set attributes
	self->x = x;
	self->y = y;
	self->radius = radius;
	// set method
	self->super_draw = self->draw;
	self->draw = Circle_draw;
}

struct Circle * make_Circle(int x, int y, int radius) {
	struct Circle * retVal = malloc(sizeof(struct Circle));
	init_Circle(retVal, x, y, radius);
	return retVal;
};

struct Square {
	int scaleFactor;
	void (*draw) (struct Drawable * self);
	void (*scaledDraw) (struct Drawable * self, int factor);
	int x;
	int y;
	int side;
	void (*super_draw) (struct Drawable * self);
};

void Square_draw(struct Square * self) {
	printf("Square with corner at (%d,%d) and side %d\n", self->x, self->y, self->side);
}

void init_Square(struct Square * self, int x, int y, int side) {
	init_Drawable(self);
	// set attributes
	self->x = x;
	self->y = y;
	self->side = side;
	// set method
	self->super_draw = self->draw;
	self->draw = Square_draw;
}

struct Square * make_Square(int x, int y, int side) {
	struct Square * retVal = malloc(sizeof(struct Square));
	init_Square(retVal, x, y, side);
	return retVal;
};

int main () {
	printf("e");
	return 1;
}