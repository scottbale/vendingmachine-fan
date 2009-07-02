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
			Coin[] coins := args[0]
			Item:Int items := args[1]
			vm.service(coins, items)
			return null
		} else {
			return super.trap(name, args)
		}
	
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