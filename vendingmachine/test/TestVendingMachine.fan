class TestVendingMachine : Test 
{
	Void testCoinReturn()
	{
		vm := VendingMachine()
		verify(vm.coinReturn().isEmpty())
	}
	
	Void testAddMoney()
	{
		vm := VendingMachine()
		vm.deposit(Int[5])
		verifyEq(vm.coinReturn().first(), 5) 
	}
}