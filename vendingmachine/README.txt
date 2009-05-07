Download Fan from http://fandev.org/

For quick setup info see http://fandev.org/doc/docTools/Setup.html

try:
fan -version
fan -version --Dfan.runtime=java
fan -version --Dfan.runtime=dotnet
fan HelloWorld.fan
fan build.fan compile test
fan vendingmachine