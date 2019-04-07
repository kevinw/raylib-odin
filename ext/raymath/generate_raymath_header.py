import os.path

this_dir = os.path.realpath(os.path.dirname(__file__))
skipping = False

with open(os.path.join(this_dir, "raymath.h")) as f:
    with open(os.path.join(this_dir, "raymath-preprocessed.h"), "w") as out:
        for line in f:
            if line == "#include <stdlib.h>":
                continue
            if line == "#include <math.h>":
                continue
            if line == "#if defined(RAYMATH_STANDALONE)\n":
                skipping = True
            elif skipping and line == "#endif\n":
                skipping = False
            else:
                if not skipping:
                    out.write(line)

