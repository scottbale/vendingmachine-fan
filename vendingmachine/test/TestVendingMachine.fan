class TestVendingMachine : Test 
{
	VendingMachine vm

	override
	Void setup()
	{
		vm = VendingMachine()
	}

	Void testCoinReturn()
	{
		verify(vm.bank.coinReturn.isEmpty)
	}
	
}