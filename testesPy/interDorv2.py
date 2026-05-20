
cifra = {'P': '7', 'O': '7', 'R': '7', 'T': '2', 'S': '6', 'E': '8', 'G': '4', 'U': '2', 'I': '2', 'C': '6', 'L': '8', 'N': '2', 'A': '4', 'Z': '8', 'F': '2', 'M': '2', 'B': '6'}
quant = int(input())
for _ in range(quant):
    frase = input()
    saida = ""
    for char in frase:
        saida += cifra[char]
    print(saida)