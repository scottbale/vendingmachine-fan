class VendingMachine
{
	Int[] coins := Int[,]

	Int[] coinReturn()
	{
		return coins
	}
	
	Void deposit(Int[] coins)
	{
		this.coins.addAll(coins)
	}
}