## Code RISCV


CodeCDataFlow_Nomodif est le code RISC-V "tel quel" après compilation
CodeCDataFlow est celui qui a été transformé par les programmes python
Les codes FIR.c sont identiques.

## compilation

 ```
 #make à faire 2 fois , genere la RI, l'ASM et les images png de la RI
make
make
```

## pour transformer le code
```
#enleve les alloca si pas de branchement
python RemoveStackRI.py

#rebuild l'ASM
make build-asm

#Remome les registres x0-x31, ajoute numeroFonction*32, remplace touts les mouvements de Stacks restants par des mouvements de registres
python RemoveStackASM.py

  ```

## RemoveStackASM n'enleve pas les allocations/deallocation de stacks 

pour la FIR
```
	addi	x34, x34, -16
	sw	x33, 12(x34)                      # 4-byte Folded Spill
	sw	x40, 8(x34)                       # 4-byte Folded Spill
	addi	x40, x34, 16

et

	lw	x33, 12(x34)                      # 4-byte Folded Reload
	lw	x40, 8(x34)                       # 4-byte Folded Reload
	addi	x34, x34, 16

```

# les registres de return
les registres pris en arguments par les fonctions et les return sont a0 - a1 - a2 - etc traduit en x10 -  x11 - x12 - x13 - etc 

# Pour la toolchain RISCV dans le /opt/riscv qui j'utilise
en root
```
git clone https://github.com/riscv/riscv-gnu-toolchain
./configure --prefix=/opt/riscv --with-arch=rv32gc --with-abi=ilp32d
make -j 10
``` 

# Variables global et static
Les variables globals (l'etat du trigger et le out des aires sous la courbes) et static (Les valeurs du FIR et le count du getData) utilise encore  des pointeurs  
