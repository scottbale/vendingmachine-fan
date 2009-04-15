class VendingMachine
{
	Int[] coins := Int[,]
	Int[] coinsPending := Int[,]

	Int[] coinReturn()
	{
		result := coinsPending.dup()
		coinsPending.clear()
		return result
	}
	
	Void deposit(Int[] coins)
	{
		this.coinsPending.addAll(coins)
	}
	
	Int[] getCoins()
	{
		return coins
	}
	
	Void loadCoins(Int[] coins)
	{
		this.coins.addAll(coins)
	}
}