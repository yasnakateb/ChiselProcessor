SBT = sbt

# Run the tests
alu:
	$(SBT) "runMain CPU.ALUMain"

alu-test:
	$(SBT) "testOnly CPU.ALUTest"

register-file:
	$(SBT) "runMain CPU.RegisterFileMain"

register-file-test:
	$(SBT) "testOnly CPU.RegisterFileTest"

register:
	$(SBT) "runMain CPU.RegisterMain"

register-test:
	$(SBT) "testOnly CPU.RegisterTest"
