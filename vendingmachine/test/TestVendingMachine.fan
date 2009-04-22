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
		verify(vm.coinReturn.isEmpty)
	}
	
	Void testDepositCoinThenCoinReturn()
	{
		vm.deposit(Coin[Coin.nickel])
		verifyEq(vm.coinReturn[0], Coin.nickel) 
		verify(vm.coinReturn.isEmpty)
	}
	
	Void testServiceLoadCoins()
	{
		verify(vm.coins.isEmpty)
		vm.loadCoins(Coin[Coin.dime])
		verifyEq(vm.coins.first, Coin.dime)
	} 
	
	Void testDepositCoinsNotReflectedInGetCoins()
	{
		vm.deposit(Coin[Coin.nickel, Coin.dime])
		verify(vm.coins.isEmpty)
	}

	Void testGetCoinsNotReflectedInCoinReturn()
	{
		vm.loadCoins(Coin[Coin.nickel, Coin.dime])
		verify(vm.coinReturn.isEmpty)
	}		
}