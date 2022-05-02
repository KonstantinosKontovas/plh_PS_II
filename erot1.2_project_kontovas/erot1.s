RAM1_ADDR EQU 0x20000100
			AREA onesecond,CODE,READONLY
			ENTRY
			EXPORT main
main		 

FILL		ADRL R6,Values  	; R6 this one has the val area 
			LDR R8,[R6, #A]  	; load value of A = 15
			MOV R0,#0      		; fn0 = 0
			MOV R1,#1			; fn1 = 1
			LDR R5,=RAM1_ADDR	; load address 0x20000100
			STR R0,[R5]			; Store value of R0 (0) --> R5 in address of 0x20000100 first fibonacci num
			ADD R5,#4			; move to the next word
			STR R1,[R5]			; Store value of R1 (1) --> R5 in address of 0x20000104 second fibonacci num
			
			
			
L1			ADD R5,#4			; Repeat loop { move to the next word
			ADD R2,R0,R1		; Add the fn0 + fn1 and save it in R2
			STR R2,[R5]			; Store Store value of R2 (x - increses in each loop) --> R5 in address of 0x200001XX
			MOV R0,R1 			; change value of R0 with the new value
			MOV R1, R2			; put value of R2 in R1
			SUBS R8,#1			; reduce counter by 1 
			BNE L1				; } End of loop.
			
stop		B stop
				
A EQU 0

			AREA onesecond, DATA, READWRITE
Values 		DCD &0F 

			END