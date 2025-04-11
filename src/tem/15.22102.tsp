import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Tem;

// MF=TEM;ID=22102;SW=0472;HW=0110  (Ochsner OTE 2.0)

/** default */
namespace _default {
  /** default *r */
  @zz(0x15)
  @base(0x6, 0x21, 0)
  model r {}

  /** [00-000] Aussentemperatur °C */
  @inherit(r)
  @ext(0x80, 0, 0x40)
  model OutsideTemp {
    parameter: parameter_temp10;
    value: temp10;
  }

  /** [00-004] Warmwasser Temperatur */
  @inherit(r)
  @ext(0x84, 0, 0x40)
  model WaterTemp {
    parameter: parameter_temp10;
    value: temp10;
  }

  /** [00-007] Vorlauftemperatur Wärmeerzeuger */
  @inherit(r)
  @ext(0x87, 0, 0x40)
  model FlowTemp {
    parameter: parameter_temp10;
    value: temp10;
  }

  /** [00-008] Rücklauftemperatur */
  @inherit(r)
  @ext(0x88, 0, 0x40)
  model ReturnTemp {
    parameter: parameter_temp10;
    value: temp10;
  }
}
