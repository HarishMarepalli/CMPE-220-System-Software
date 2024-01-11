COPYFLOAT	START	1000		:Execution of the program starts here
			LDT		#100		:Load the value of 100 into T register
			LDX		#0			:Load the value of 0 into X(Index) register
LOOP		LDF		ARRAYA,X	:Load the floating point number at the current index from arrayA into the floating point accumulator
			MULF	ARRAYB,X	:Multiply the floating point number at the current index from arrayB with the accumulator
			STF		ARRAYC,X	:Store the result in arrayC at the current index
			TIXR	T			:Increment the X value and compare it with the value in register T, and update the CC flag
			JLT		LOOP		:If X<[T], then continue the loop
		
ARRAYA		RESW	200			:Reserve 200 Words (48-bit is 2 words => 2*100=200) for ARRAYA
ARRAYB		RESW	200			:Reserve 200 Words for ARRAYB
ARRAYC		RESW	200			:Reserve 200 Words for ARRAYC
			END		1000		:Execution of the program ends here