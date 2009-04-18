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
		vm.deposit(Coin[Coin.nickel])
		verifyEq(vm.coinReturn().first(), Coin.nickel) 
		verify(vm.coinReturn().isEmpty())
	}
	
	Void testServiceLoadCoins()
	{
		verify(vm.getCoins().isEmpty())
		vm.loadCoins(Coin[Coin.dime])
		verifyEq(vm.getCoins().first(), Coin.dime)
	} 
	
	Void testDepositCoinsNotReflectedInGetCoins()
	{
		vm.deposit(Coin[Coin.nickel, Coin.dime])
		verify(vm.getCoins().isEmpty())
	}

	Void testGetCoinsNotReflectedInCoinReturn()
	{
		vm.loadCoins(Coin[Coin.nickel, Coin.dime])
		verify(vm.coinReturn().isEmpty())
	}		
}