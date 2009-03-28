class TestVendingMachine : Test 
{
	Void testCoinReturn()
	{
		vm := VendingMachine()
		verify(vm.coinReturn().isEmpty())
	}
}