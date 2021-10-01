eanCode = list(input("enter ean code without controll bit: "))

if (len(eanCode) != 12):
    print("invalid code")
    exit(-1)

evenSum = 0
for i in range(0, len(eanCode), 2):
    evenSum += int(eanCode[i])

oddSum = 0
for i in range(1, len(eanCode), 2):
    oddSum += int(eanCode[i])

oddSum *= 3

controllBit = 10 - (evenSum + oddSum) % 10

print("controll bit:", controllBit)
