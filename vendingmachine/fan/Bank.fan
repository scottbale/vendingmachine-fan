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
			Int changeDue := this.moveCoins(price)
			this.makeChange(changeDue)
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
	
	private Int moveCoins(Int price)
	{
		Int changeDue := coinsPending.reduce(0) |Obj change, Coin coin->Obj| { return (Int)change + coin.cents }
		changeDue -= price
		this.coins.addAll(coinsPending)
		this.coinsPending.clear
		return changeDue
	}
	
	private Void makeChange(Int changeDue)
	{
		this.sortCoins
		echo("sorted coins: " + coins)
		coins.eachWhile |Coin coin->Int?| 
		{ 
			if ( coin.cents <= changeDue )
			{
				coinsPending.add(coin)
				changeDue -= coin.cents
			}
			return changeDue == 0 ? changeDue : null
		}
		coinsPending.each| Coin coin | {coins.remove(coin) }
	}
	
	private Void sortCoins(){
		coins.sortr |Coin a, Coin b->Int| { return a.cents <=> b.cents }
	}
}