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

register-with-enable:
	$(SBT) "runMain CPU.RegisterWithEnableMain"

register-with-enable-test:
	$(SBT) "testOnly CPU.RegisterWithEnableTest"

control-unit:
	$(SBT) "runMain CPU.ControlUnitMain"

control-unit-test:
	$(SBT) "testOnly CPU.ControlUnitTest"

memory:
	$(SBT) "runMain CPU.MemoryMain"

memory-test:
	$(SBT) "testOnly CPU.MemoryTest -- -DwriteVcd=1"

control-branch:
	$(SBT) "runMain CPU.ControlBranchMain"

control-branch-test:
	$(SBT) "testOnly CPU.ControlBranchTest"

shifter:
	$(SBT) "runMain CPU.ShifterMain"

shifter-test:
	$(SBT) "testOnly CPU.ShifterTest"

shifter-sign-imm:
	$(SBT) "runMain CPU.ShifterSignImmMain"

shifter-sign-imm-test:
	$(SBT) "testOnly CPU.ShifterSignImmTest"

sign-extension:
	$(SBT) "runMain CPU.SignExtensionMain"

sign-extension-test:
	$(SBT) "testOnly CPU.SignExtensionTest"

processor:
	$(SBT) "runMain CPU.ProcessorMain"

processor-test:
	$(SBT) "testOnly CPU.ProcessorTest -- -DwriteVcd=1"
