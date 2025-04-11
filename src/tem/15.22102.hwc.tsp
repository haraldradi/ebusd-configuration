import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Tem;

// MF=TEM;ID=22102;SW=0472;HW=0110  (Ochsner OTE 2.0)

/** hot water circuit */
namespace hwc {
  /** default *r */
  @zz(0x15)
  @base(0x6, 0x21, 0x79)
  model r {}

  /** [02-052] ??? */
  @inherit(r)
  @ext(0x80, 0, 0x0e)
  @poll(1)
  model Status {
    parameter: parameter1;
    value: status_temp;
  }

  /** [00-004] Warmwasser */
  @inherit(r)
  @ext(0x81, 0, 0x0e)
  @poll(9)
  model HotWaterTemp {
    parameter: parameter_temp10;
    value: temp10;
  }

  /** [01-004] Warmwasser Sollwert */
  @inherit(r)
  @ext(0x82, 0, 0x0e)
  model TargetHotWaterTemp {
    parameter: parameter_temp10;
    value: temp10;
  }
}