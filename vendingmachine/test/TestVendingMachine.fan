class TestVendingMachine : Test 
{
	VendingMachine? vm

	override
	Void setup()
	{
		vm = VendingMachine()
	}

	Void testCoinReturn()
	{
		verify(vm.coinReturn.isEmpty)
	}
	
	Void testService()
	{
		coins := [Coin.quarter, Coin.nickel]
		vm.service(coins, Item:Int[Item.B:3, Item.C:2])
		verifyEq(coins, vm.bank.coins)
		verifyEq(5, vm.inventory.count)
	}
	
	Void testBuy()
	{
		vm.service([Coin.quarter, Coin.dime, Coin.nickel], Item:Int[Item.A:3, Item.C:2])
		coins := [Coin.quarter, Coin.quarter, Coin.quarter]
		vm.deposit(coins)
		verifyEq(Item.A, vm.buy(Item.A))
		verify(vm.coinReturn.containsAll([Coin.dime]))
		verifyEq(4, vm.inventory.count)
		
		// insufficient funds
		verifyNull(vm.buy(Item.C))
		verifyEq(4, vm.inventory.count)
		verify(vm.coinReturn.isEmpty)
		
		// item not in inventory
		vm.deposit(coins)
		verifyNull(vm.buy(Item.B))
		verifyEq(4, vm.inventory.count)
		verifyEq(coins, vm.coinReturn)
	}
	
}