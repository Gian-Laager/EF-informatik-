values = [True, False]

print("a\t|\tb\t|\tc\t|\td\t||\te\t|\tf\t|\ty")
print("#####################################################################################################")
for a in values:
    for b in values:
        for c in values:
            for d in values:
                e = a and b
                f = c ^ d
                g = not (e or f)
                y = d ^ g
                print(a, b, c, d, sep="\t|\t", end="")
                print("\t||\t", end="")
                print(e, f, y, sep="\t|\t")
                print("-----------------------------------------------------------------------------------------------------")