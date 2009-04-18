class VendingMachine
{
	Coin[] coins := Coin[,]
	Coin[] coinsPending := Coin[,]

	Coin[] coinReturn()
	{
		result := coinsPending.dup()
		coinsPending.clear()
		return result
	}
	
	Void deposit(Coin[] coins)
	{
		this.coinsPending.addAll(coins)
	}
	
	Coin[] getCoins()
	{
		return coins
	}
	
	Void loadCoins(Coin[] coins)
	{
		this.coins.addAll(coins)
	}
}