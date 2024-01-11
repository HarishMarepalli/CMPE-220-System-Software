FIBONACCI	START	1000				:Execution of the program starts here
			LDA		#0					:Load the value 0 into the Accumulator
			STA		FIBOARRAY			:Store the accumulator to FIBOARRAY array
			LDA		#1					:Load the accumulator with value 1
			STA		FIBOARRAY, 1		:Again store the accumulator to FIBOARRAY array

			LDX		#2					:Load the value of 2 into the X (Index) register
			
LOOP		LDA		X					:To Calculate X-1, load X into accumulator
			SUB		#1					:Subtract 1 from the accumulator content
			STA		TEMPX1				:Store it into TEMPX1 variable => TEMPX1 = X-1
			
			LDA		X					:To Calculate X-2, load X into accumulator
			SUB		#2					:Subtract 2 from the accumulator content
			STA		TEMPX2				:Store it into TEMPX2 variable => TEMPX2 = X-2
			
			LDA		FIBOARRAY, TEMPX1	:Load the value of FIBOARRAY[X-1] into the accumulator
			ADD		FIBOARRAY, TEMPX2	:Add the value in accumulator with FIBOARRAY[X-2] i.e., [A] = FIBOARRAY[X-1] + FIBOARRAY[X-2]
			STA		FIBOARRAY, X		:Store the added value into the current index X of FIBOARRAY array
			LDA		X					:Load the accumulator with X value
			ADD		#1					:Increment the X value by 1
			COMP	#15					:Compare the X value with the #15 and update the CC Flag
			JEQ		ENDLOOP				:If Equal to #15, End the loop
			STA		X					:Else, store the updated X value into the X register
			JLT		LOOP				:If less than the #15, loop back again
			
ENDLOOP
	
TEMPX1		RESW	1					:Reserve a Word for TEMPX1
TEMPX2		RESW	1					:Reserve a Word for TEMPX2
FIBOARRAY		RESW	15				:Reserve 15 Words for FIBOARRAY

			END		START				:Execution of the program ends here