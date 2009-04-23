class Bank
{
	Coin[] coins := Coin[,]
	Coin[] coinsPending := Coin[,]

	Coin[] coinReturn()
	{
		result := coinsPending.dup
		coinsPending.clear
		return result
	}
	
	Void deposit(Coin[] coins)
	{
		this.coinsPending.addAll(coins)
	}
	
	Void loadCoins(Coin[] coins)
	{
		this.coins.addAll(coins)
	}
	
	Bool purchase(Int price)
	{
		if (this.sufficientFunds(price)){
			this.coins.addAll(coinsPending)
			this.coinsPending.clear
			return true
		}
		return false
	}
	
	private Bool sufficientFunds(Int price)
	{
		amt := 0
		coinsPending.each | Coin coin | {amt += coin.cents}
		if (amt >= price){
			return true
		}
		return false
	}
}