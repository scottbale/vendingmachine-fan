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
		verify(vm.coinReturn().isEmpty())
	}
	
	Void testDepositCoinThenCoinReturn()
	{
		vm.deposit(Int[5])
		verifyEq(vm.coinReturn().first(), 5) 
		verify(vm.coinReturn().isEmpty())
	}
	
	Void testAdminLoadCoins()
	{
		verify(vm.getCoins().isEmpty())
		vm.loadCoins(Int[3])
		verifyEq(vm.getCoins().first(), 3)
	} 
	
	Void testDepositCoinsNotReflectedInGetCoins()
	{
		vm.deposit(Int[5,3])
		verify(vm.getCoins().isEmpty())
	}

	Void testGetCoinsNotReflectedInCoinReturn()
	{
		vm.loadCoins(Int[5,3])
		verify(vm.coinReturn().isEmpty())
	}		
}