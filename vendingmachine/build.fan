#! /usr/bin/env fan
using build

class Build : BuildPod
{
  override Void setup()
  {
    podName     = "vm"
  }
}