enum Coin
{
  nickel(5),
  dime(10),
  quarter(25),
  dollar(100);

  private new make(Int cents) { this.cents = cents; }

  const Int cents;
}