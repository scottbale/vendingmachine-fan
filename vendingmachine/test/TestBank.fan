class TestBank : Test 
{
	Bank bank

	override
	Void setup()
	{
		bank = Bank()
	}

	Void testCoinReturn()
	{
		verify(bank.coinReturn.isEmpty)
	}
	
	Void testDepositCoinThenCoinReturn()
	{
		bank.deposit(Coin[Coin.nickel])
		verifyEq(bank.coinReturn[0], Coin.nickel) 
		verify(bank.coinReturn.isEmpty)
	}
	
	Void testServiceLoadCoins()
	{
		verify(bank.coins.isEmpty)
		bank.loadCoins(Coin[Coin.dime])
		verifyEq(bank.coins.first, Coin.dime)
	} 
	
	Void testDepositCoinsNotReflectedInGetCoins()
	{
		bank.deposit(Coin[Coin.nickel, Coin.dime])
		verify(bank.coins.isEmpty)
	}

	Void testGetCoinsNotReflectedInCoinReturn()
	{
		bank.loadCoins(Coin[Coin.nickel, Coin.dime])
		verify(bank.coinReturn.isEmpty)
	}
}	
