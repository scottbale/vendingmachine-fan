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
	
	Void testPurchaseWithInsufficientFunds()
	{
		coins := Coin[Coin.nickel, Coin.dime]
		bank.deposit(coins)
		verifyFalse(bank.purchase(85))
		verifyEq(coins, bank.coinReturn)
	}
	
	Void testPurchase()
	{
		coins := Coin[Coin.quarter, Coin.quarter, Coin.dime]
		bank.deposit(coins)
		verify(bank.purchase(60))
		verify(bank.coinReturn.isEmpty)
		verifyEq(3, bank.coins.size)
		verify(coins.containsAll(bank.coins))
	}
	
	Void testPurchaseChangeNeededButNotAvailable()
	{
		coins := Coin[Coin.quarter, Coin.quarter, Coin.quarter]
		bank.deposit(coins)
		verify(bank.purchase(60))
		verify(bank.coinReturn.isEmpty)
	}
	
	Void testPurchaseChangeNeeded()
	{
		bank.loadCoins(Coin[Coin.dime, Coin.nickel, Coin.quarter])
		coins := Coin[Coin.quarter, Coin.quarter, Coin.quarter]
		bank.deposit(coins)
		verify(bank.purchase(60))
		Coin[] returned := bank.coinReturn
		verifyEq(2, returned.size)
		verify(returned.containsAll(Coin[Coin.dime, Coin.nickel]))
	}

}	
