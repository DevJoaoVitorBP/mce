;3. Repita o problema anterior para uma contagem decimal de 60 até 00.
;2. Faça no DEEDS McE um programa que executa uma contagem decrescente em hexadecimal de 60 h até 00 h.

	LXI SP,0FFFFH
	MVI A,3CH
volta:	
	PUSH PSW
	CALL HEXTODEC	
	CALL MOSTRAA
	POP PSW
	CPI 00H
	JZ fim
	DCR A
	JMP volta
fim:	
	HLT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;HEXTODEC - converte numero hexa para a base 10
;Recebe numero em A
;Retorna resultado como numero de 2 digitos em  A
;Utiliza regs A,B,C
;Chama a sub-rotina DIV
HEXTODEC:
	MVI C,0AH
	MOV B,A
	CALL DIV        ; QUOCIENTE EM DE H RESTO EM L
	MOV A,H
	ANI 0FH
	RLC
	RLC
	RLC	
	RLC
	ORA L
	RET            

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;DIV - sub-rotina para divisao
;Recebe dividendo em B e divisor em C
;Retorna quociente em H e resto em L
;Utiliza regs A, B, C, H e L
DIV:    
	LXI H,0000H
	MOV A,B
SUB_:    
	CMP C
	JC RESTO
	SUB C
	INR H
	JMP SUB_
RESTO:  
	MOV L,A
	RET

MOSTRAA:
	OUT 00h
	XRA A
	RET
