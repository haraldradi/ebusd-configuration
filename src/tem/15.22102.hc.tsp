import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Tem;

// MF=TEM;ID=22102;SW=0472;HW=0110  (Ochsner OTE 2.0)

/** heating circuit */
namespace hc {
  /** default *r */
  @zz(0x15)
  @base(0x6, 0x21, 0x77)
  model r {}

  /** [02-051] Status Heizkreisregelung */
  @inherit(r)
  @ext(0x80, 0, 0x08)
  @poll(1)
  model Status {
    parameter: parameter1;
    value: status23;
  }

  /** [00-000] Aussentemperatur */
  @inherit(r)
  @ext(0x81, 0, 0x08)
  @poll(9)
  model OutsideTemp {
    parameter: parameter_temp10;
    value: temp10;
  }

  /** [02-020] Aussentemperatur Mittelwert */
  @inherit(r)
  @ext(0x82, 0, 0x08)
  model AvgOutsideTemp {
    parameter: parameter_temp10;
    value: temp10;
  }

  /** [00-001] Raumtemperatur HK1 */
  @inherit(r)
  @ext(0x83, 0, 0x08)
  @poll(9)
  model RoomTemp {
    parameter: parameter_temp10;
    value: temp10;
  }

  /** [01-001] Raumtemperatur Sollwert */
  @inherit(r)
  @ext(0x84, 0, 0x08)
  @poll(9)
  model TargetRoomTemp {
    parameter: parameter_temp10;
    value: temp10;
  }

  /** [00-002] Heizkreis Vorlauftemperatur HK1 */
  @inherit(r)
  @ext(0x85, 0, 0x08)
  model FlowTemp {
    parameter: parameter_temp10;
    value: temp10;
  }

  /** [01-002] Heizkreis Vorlauftemperatur Sollwert */
  @inherit(r)
  @ext(0x86, 0, 0x08)
  model TargetFlowTemp {
    parameter: parameter_temp10;
    value: temp10;
  }

  /** [00-058] Relative Feuchte */
  @inherit(r)
  @ext(0x87, 0, 0x08)
  @poll(9)
  model Humidity {
    parameter: parameter1;
    value: SIN;
  }
}