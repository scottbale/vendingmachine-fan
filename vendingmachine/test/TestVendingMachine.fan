class TestVendingMachine : Test 
{
	Void testCoinReturn()
	{
		vm := VendingMachine()
		verify(vm.coinReturn().isEmpty())
	}
	
	Void testDepositCoinThenCoinReturn()
	{
		vm := VendingMachine()
		vm.deposit(Int[5])
		verifyEq(vm.coinReturn().first(), 5) 
		verify(vm.coinReturn().isEmpty())
	}
	
	Void testAdminLoadCoins()
	{
		vm := VendingMachine()
		verify(vm.getCoins().isEmpty())
		vm.loadCoins(Int[3])
		verifyEq(vm.getCoins().first(), 3)
	} 
	
	Void testDepositCoinsNotReflectedInGetCoins()
	{
	}
		
}