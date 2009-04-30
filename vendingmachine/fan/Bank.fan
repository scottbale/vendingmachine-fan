class Bank
{
	Coin[] coins := Coin[,]
	Coin[] coinsToReturn := Coin[,]

	Coin[] coinReturn()
	{
		result := coinsToReturn.dup
		coinsToReturn.clear
		return result
	}
	
	Void deposit(Coin[] coins)
	{
		coinsToReturn.addAll(coins)
	}
	
	Void loadCoins(Coin[] coins)
	{
		this.coins.addAll(coins)
	}
	
	Bool purchase(Int price)
	{
		if (sufficientFunds(price)){
			Int changeDue := acceptCoins(price)
			makeChange(changeDue)
			return true
		}
		return false
	}
	
	private Bool sufficientFunds(Int price)
	{
		amt := 0
		coinsToReturn.each | Coin coin | {amt += coin.cents}
		if (amt >= price){
			return true
		}
		return false
	}
	
	private Int acceptCoins(Int price)
	{
		Int changeDue := coinsToReturn.reduce(0) |Obj change, Coin coin->Obj| { return (Int)change + coin.cents }
		changeDue -= price
		coins.addAll(coinsToReturn)
		coinsToReturn.clear
		return changeDue
	}
	
	private Void makeChange(Int changeDue)
	{
		sortCoins
		coins.eachWhile |Coin coin->Int?| 
		{ 
			if ( coin.cents <= changeDue )
			{
				coinsToReturn.add(coin)
				changeDue -= coin.cents
			}
			return changeDue == 0 ? changeDue : null
		}
		coinsToReturn.each| Coin coin | {coins.remove(coin) }
	}
	
	private Void sortCoins(){
		coins.sortr |Coin a, Coin b->Int| { return a.cents <=> b.cents }
	}
}