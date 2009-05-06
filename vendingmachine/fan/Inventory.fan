class Inventory
{
	// empty map
	[Item:Int] items := Item:Int[:]
	
	Void add([Item:Int] itemsAndCounts)
	{
		itemsAndCounts.each |Int val, Item key| { items.set(key, val + items.get(key, 0)) }
	}	
	
	Int count()
	{
		return items.reduce(0) |Obj count, Int itemCount->Obj| { return (Int)count + itemCount }
	}
	
	Item? remove(Item item){
		if (items.containsKey(item))
		{
			items[item]--
			if (items[item]==0)
			{
				items.remove(item)
			}
			return item
			
		}
		return null
	}
	
	Bool hasItem(Item item){
		return items.containsKey(item)
	}
}