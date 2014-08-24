dev = DeviceOpen[
  "Serial", {"/dev/cu.usbserial-A6024CMA", "BaudRate" -> 115200}]

data = {};

volt = {};

task = RunScheduledTask[
  If[DeviceExecute[dev, "SerialReadyQ"],
   Module[{csv, raw},
    csv = FromCharacterCode[DeviceReadBuffer[dev]];
    raw = Flatten[Cases[ImportString[csv, "CSV"], {_Real}]];
    volt = ToExpression[raw, TraditionalForm];
    data = Join[data, volt];
    ]],
  0.2
  ]

Print[Dynamic[volt]]

Dynamic[ListLinePlot[data]]