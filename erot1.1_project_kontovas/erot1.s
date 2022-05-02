RAM1_ADDR EQU 0x20000020
			  
			AREA onefirst,CODE,READONLY
			ENTRY
			EXPORT main
main		 

FILL		MOV R1,#1
			MOV R0,#24
			LDR R2,=RAM1_ADDR
			
L1			STR R1,[R2]
			ADD R1,R1,#3
			ADD R2,R2,#1
			SUBS R0,R0,#1
			BNE L1
			
stop		B stop
			
			END