W = 50; // width of the specimen
H = 50; // height of the specimen

DX = 10; // horizontal spacing between PCM cells
DY = 10; // vertical spacing between PCM cells
rho = 0.8; // porosity
r = Sqrt(rho); // ratio between the PCM cell size and the spacing
rDX = r*DX;
rDY = r*DY;
pX = (DX-rDX)/2;
pY = (DY-rDY)/2;

tSiC = 3; // thickness of the SiC layer
tG = 3; // thickness of the outer graphite layer

NX = Floor(W/DX);
NY = Floor(H/DY);

ee = 2;

pc = 1;
lc = 1;
llc = 1;
sc = 1;

// PCM infills
For i In {0:NY-1:1}
  For j In {0:NX-1:1}
    cx = (j+0.5)*DX;
    cy = (i+0.5)*DY;
    Point(pc++) = {cx-rDX/2, cy-rDY/2, 0, ee};
    Point(pc++) = {cx+rDX/2, cy-rDY/2, 0, ee};
    Point(pc++) = {cx+rDX/2, cy+rDY/2, 0, ee};
    Point(pc++) = {cx-rDX/2, cy+rDY/2, 0, ee};
    Line(lc++) = {pc-4, pc-3};
    Line(lc++) = {pc-3, pc-2};
    Line(lc++) = {pc-2, pc-1};
    Line(lc++) = {pc-1, pc-4};
    Line Loop(llc++) = {lc-4, lc-3, lc-2, lc-1};
    Plane Surface(sc++) = {llc-1};
  EndFor
EndFor

// Graphite foam
Point(pc++) = {0-pX, 0-pY, 0, ee};
Point(pc++) = {W+pX, 0-pY, 0, ee};
Point(pc++) = {W+pX, H+pY, 0, ee};
Point(pc++) = {0-pX, H+pY, 0, ee};
Line(lc++) = {pc-4, pc-3};
Line(lc++) = {pc-3, pc-2};
Line(lc++) = {pc-2, pc-1};
Line(lc++) = {pc-1, pc-4};
Line Loop(llc++) = {lc-4, lc-3, lc-2, lc-1};
Plane Surface(sc++) = {llc-1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25};

// SiC layers
Point(pc++) = {0-pX-tSiC, 0-pY, 0, ee};
Point(pc++) = {0-pX, 0-pY, 0, ee};
Point(pc++) = {0-pX, H+pY, 0, ee};
Point(pc++) = {0-pX-tSiC, H+pY, 0, ee};
Line(lc++) = {pc-4, pc-3};
Line(lc++) = {pc-3, pc-2};
Line(lc++) = {pc-2, pc-1};
Line(lc++) = {pc-1, pc-4};
Line Loop(llc++) = {lc-4, lc-3, lc-2, lc-1};
Plane Surface(sc++) = {llc-1};

Point(pc++) = {W+pX+tSiC, 0-pY, 0, ee};
Point(pc++) = {W+pX, 0-pY, 0, ee};
Point(pc++) = {W+pX, H+pY, 0, ee};
Point(pc++) = {W+pX+tSiC, H+pY, 0, ee};
Line(lc++) = {pc-4, pc-3};
Line(lc++) = {pc-3, pc-2};
Line(lc++) = {pc-2, pc-1};
Line(lc++) = {pc-1, pc-4};
Line Loop(llc++) = {lc-4, lc-3, lc-2, lc-1};
Plane Surface(sc++) = {llc-1};

// outer graphite layers
Point(pc++) = {0-pX-tSiC-tG, 0-pY, 0, ee};
Point(pc++) = {0-pX-tSiC, 0-pY, 0, ee};
Point(pc++) = {0-pX-tSiC, H+pY, 0, ee};
Point(pc++) = {0-pX-tSiC-tG, H+pY, 0, ee};
Line(lc++) = {pc-4, pc-3};
Line(lc++) = {pc-3, pc-2};
Line(lc++) = {pc-2, pc-1};
Line(lc++) = {pc-1, pc-4};
Line Loop(llc++) = {lc-4, lc-3, lc-2, lc-1};
Plane Surface(sc++) = {llc-1};

Point(pc++) = {W+pX+tSiC+tG, 0-pY, 0, ee};
Point(pc++) = {W+pX+tSiC, 0-pY, 0, ee};
Point(pc++) = {W+pX+tSiC, H+pY, 0, ee};
Point(pc++) = {W+pX+tSiC+tG, H+pY, 0, ee};
Line(lc++) = {pc-4, pc-3};
Line(lc++) = {pc-3, pc-2};
Line(lc++) = {pc-2, pc-1};
Line(lc++) = {pc-1, pc-4};
Line Loop(llc++) = {lc-4, lc-3, lc-2, lc-1};
Plane Surface(sc++) = {llc-1};

Physical Surface("PCM") = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25};
Physical Surface("G") = {26, 29, 30};
Physical Surface("SiC") = {27, 28};
Physical Line("top") = {103, 107, 111, 115, 119};
Physical Line("bottom") = {101, 105, 109, 113, 117};
Physical Line("left") = {116};
Physical Line("right") = {120};