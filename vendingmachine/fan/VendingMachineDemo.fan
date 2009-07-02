class VendingMachineDemo
{

	VendingMachine vm

	new make(VendingMachine vm)
	{
		this.vm = vm
	}
	
	override Obj? trap(Str name, Obj?[]? args){
	
		if (name == "info"){
			return "demo: $vm"
		} else if (name == "service"){
			echo("Servicing machine: $args")
			Coin:Int coinsMap := args[0]
			Item:Int itemsMap := args[1]
			vm.service(getListFromMap(coinsMap), itemsMap)
			return null
		} else if (name == "deposit"){
			vm.deposit(getListFromMap(args[0]))
			return null
		} else if (name == "buy"){
			return vm.buy(args[0])
		} else if (name == "coinReturn"){
			return vm.coinReturn
		} else if (name == "itemPurchaser"){
			return |->Item?|
				{
					return vm.buy(args[0])
				}
		} else if (name == "purchaser"){
			return |Coin:Int coinMap, Item item->Item?|
				{
					vm.deposit(getListFromMap(coinMap))
						return vm.buy(item)
				}
		} else {
			return super.trap(name, args)
		}
	}
	
	private Coin[] getListFromMap(Coin:Int coinsMap)
	{
		Coin[] coinList := Coin[,]
		coinsMap.each | Int value, Coin key| 
		{
			coinList.fill(key, value)
		}
		return coinList
	}
	
	Void go()
	{
		echo("////////////////////////////////////////////////////////////////")
		echo("Fan Vending Machine Demo")
		echo("////////////////////////////////////////////////////////////////")
		
		echo("Servicing machine")
		vm.service([Coin.nickel, Coin.dime, Coin.quarter, Coin.quarter], [Item.A:5, Item.C:5])
		info()
		
		coinReturn

		echo("Depositing \$.75")
		vm.deposit([Coin.quarter, Coin.quarter, Coin.quarter])
		info()
		
		coinReturn

		echo("Depositing \$.75 again")
		vm.deposit([Coin.quarter, Coin.quarter, Coin.quarter])
		info()

		echo("Can't buy item C - too expensive")
		echo(vm.buy(Item.C))
		info()
		
		echo("Can't buy item B - none in stock")
		echo(vm.buy(Item.B))
		info()
		
		echo("buy item A - change due \$.10")
		echo(vm.buy(Item.A))
		info()
		
		coinReturn
		
		echo("Depositing \$.75 again")
		vm.deposit([Coin.quarter, Coin.quarter, Coin.quarter])
		info()
		
		echo("buy item A - change due \$.10 - not enough exact change, d'oh!")
		echo(vm.buy(Item.A))
		info()
		
		coinReturn
		
		echo("Servicing machine - replenishing A, adding B, adding small coins")
		vm.service([Coin.nickel, Coin.dime, Coin.dime], [Item.A:2, Item.B:5])
		info()
		
		echo("Depositing \$1.00")
		vm.deposit([Coin.quarter, Coin.quarter, Coin.quarter, Coin.quarter])
		info()
		
		echo("buy item B")
		echo(vm.buy(Item.B))
		info()
		
		coinReturn		
	}
	
	private Void coinReturn()
	{
		echo("Coin return")
		echo(vm.coinReturn)
		info()
	}
	
	Void info()
	{
		echo(vm.toStr)
	}
}