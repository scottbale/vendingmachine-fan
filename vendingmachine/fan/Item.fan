enum Item
{
  A(65),
  B(100),
  C(150);

  private new make(Int cost) { this.cost = cost; }

  const Int cost;
}