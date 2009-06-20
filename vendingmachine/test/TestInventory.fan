class TestInventory : Test 
{
	Inventory? inventory

	override
	Void setup()
	{
		inventory = Inventory()
	}

	Void testEmpty()
	{
		verifyEq(0, inventory.count)
	}
	
	Void testAddInventory()
	{
		inventory.add([Item.A:2])
		inventory.add([Item.A:1, Item.B:2])
		verifyEq(5, inventory.count)
		inventory.add([Item.B:3, Item.C:2])
		verifyEq(10, inventory.count)
	}
	
	Void testRemoveItem()
	{
		inventory.add([Item.B:5, Item.C:2])
		verifyEq(7, inventory.count)
		verifyEq(Item.B, inventory.remove(Item.B))
		verifyEq(6, inventory.count)
		verifyNull(inventory.remove(Item.A))
		verifyEq(6, inventory.count)
	}
	
	Void testHasItem()
	{
		inventory.add([Item.B:5, Item.C:2])
		verify( inventory.hasItem(Item.C))
		verifyFalse( inventory.hasItem(Item.A))
	}
}