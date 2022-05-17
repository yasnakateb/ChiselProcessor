SBT = sbt

# Run the tests
alu:
	$(SBT) "runMain CPU.ALUMain"

alu-test:
	$(SBT) "testOnly CPU.ALUTest"

# Clean everything (including IntelliJ project settings)
clean:
	git clean -fd