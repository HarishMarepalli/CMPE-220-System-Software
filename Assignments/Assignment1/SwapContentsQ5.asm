SWAP	START	1000	:Execution of the program starts here
		LDA		ALPHA	:Load alpha into the accumulator
		STA		TEMP	:Store the contents of the accumulator in a temporary location
		LDA		BETA	:Load beta into the accumulator
		STA		ALPHA	:Store the contents of the accumulator in alpha
		LDA		TEMP	:Load the contents of temp into the accumulator
		STA		BETA	:Store the contents of the accumulator in beta
ALPHA	RESW	1		:Reserve 1 word for alpha
BETA	RESW	1		:Reserve 1 word for beta
TEMP	RESW	1		:Reserve 1 word for temp
		END		1000	:Execution of the program ends here