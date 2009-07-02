class VendingMachine
{

	Bank bank := Bank()
	Inventory inventory := Inventory()
	
	Coin[] coinReturn()
	{
		return bank.coinReturn
	}	
	
	Void deposit(Coin[] coins)
	{
		bank.deposit(coins)
	}	
	
	Item? buy(Item item)
	{
		if (inventory.hasItem(item) && bank.purchase(item.cost))
		{
			return inventory.remove(item)
		}
		return null
	}
	
	Void service(Coin[] coins, [Item:Int] items)
	{
		bank.loadCoins(coins)
		inventory.add(items)
	}
	
	override Str toStr()
	{
		return"\n-Inventory: $inventory.items\n-Available coins: $bank.coins\n-Coins to return: $bank.coinsToReturn\n"
	}	
}