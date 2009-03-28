using build

class Build : BuildPod
{
  override Void setup()
  {
    podName     = "vendingmachine"
    version     = globalVersion
    description = "Lambda Lounge Language Shootout - Fan Vending Machine"
    depends     = ["sys 1.0"]
    srcDirs     = [`fan/`, `test/`]
  }
}