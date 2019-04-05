import os.path

this_dir = os.path.realpath(os.path.dirname(__file__))
skipping = False

with open(os.path.join(this_dir, "raygui.h")) as f:
    with open(os.path.join(this_dir, "raygui-preprocessed.h"), "w") as out:
        for line in f:
            if line == "#include <stdlib.h>":
                continue
            if line == "#if defined(RAYGUI_STANDALONE)\n":
                skipping = True
            elif line == "#endif      // RAYGUI_STANDALONE\n":
                skipping = False
            else:
                if not skipping:
                    out.write(line)

