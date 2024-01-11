ARRAYCMP	START	1000		:Execution of the program starts here
			LDA		ZERO		:Load 0 into the accumulator to initialize the matches count
			LDX		ZERO		:Load 0 into index register X to initialize the loop counter
LOOP		LDA		ARRAYA,X	:Start of the loop. Load the word at the current index from arrayA into the accumulator
			STA		TEMP		:Store this value into TEMP for future comparison
			LDA		ARRAYB,X	:Load the word at the same index from arrayB into the accumulator
			COMP	TEMP		:Compare arrayA[X] to arrayB[X] and update the CC flag
			JEQ		MATCH		:Jump to MATCH if both are equal
			TIX		LMT			:If they are not equal, Increment X and compare X with LMT, update the CC flag
			JEQ		ENDLOOP		:End the loop if the LMT is reached.
			JLT		LOOP		:Loop through the arrays again if the LMT is not reached.
MATCH		LDA		MATCHES		:Start of the match routine. Load the value from MATCHES to Accumulator
			ADD		ONE			:Increment by 1
			STA		MATCHES		:Store it back into MATCHES location
			TIX		LMT			:Increment X and compare it with LMT, and update the CC flag
			JEQ		ENDLOOP		:If the LMT is reached, end the loop
			JLT		LOOP		:If the LMT is not reached, loop through the arrays again
ENDLOOP							:Loop ends

ZERO		WORD	0			:Declare ZERO variable with 0
LMT			WORD	100			:Declare LMT (which indicates limit) variable with 100
ONE			WORD	1			:Declare ONE variable with 1
MATCHES		WORD	0			:Declare MATCHES variable with 0
ARRAYA		RESW	100			:Reserve 100 Words for arrayA
ARRAYB		RESW	100			:Reserve 100 Words for arrayB
TEMP		RESW	1			:Reserve 1 Word for TEMP
			END		1000		:Execution of the program ends here