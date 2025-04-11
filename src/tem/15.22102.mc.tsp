import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Tem;

// MF=TEM;ID=22102;SW=0472;HW=0110  (Ochsner OTE 2.0)

/** mixer circuit */
namespace mc {
  /** default *r */
  @zz(0x15)
  @base(0x6, 0x21, 0x7d)
  model r {}

  /** [02-053] Status Wärmeerzeugerregelung */
  @inherit(r)
  @ext(0x80, 0, 0x02)
  @poll(1)
  model Status {
    parameter: parameter1;
    value: status1;
  }

  /** [00-007] Wärmeerzeuger Vorlauftemperatur */
  @inherit(r)
  @ext(0x81, 0, 0x02)
  model FlowTemp {
    parameter: parameter_temp10;
    value: temp10;
  }

  /** [01-007] Wärmeerzeuger Vorlauftemperatur Sollwert */
  @inherit(r)
  @ext(0x82, 0, 0x02)
  model TargetFlowTemp {
    parameter: parameter_temp10;
    value: temp10;
  }

  /** [00-008] Wärmeerzeuger Rücklauftemperatur */
  @inherit(r)
  @ext(0x83, 0, 0x02)
  model ReturnTemp {
    parameter: parameter_temp10;
    value: temp10;
  }

  /** [00-070] Wärmequellen Austrittstemperatur */
  @inherit(r)
  @ext(0x84, 0, 0x02)
  model OutletTemp {
    parameter: parameter_temp10;
    value: temp10;
  }

  /** [00-071] Wärmequellen Eintrittstemperatur */
  @inherit(r)
  @ext(0x85, 0, 0x02)
  model InletTemp {
    parameter: parameter_temp10;
    value: temp10;
  }

  /** [02-080] Schaltzyklen */
  @inherit(r)
  @ext(0x86, 0, 0x02)
  @poll(9)
  model SwitchingCycles {
    parameter: parameter2;
    value: HCD;
  }

  /** [02-081] Betriebsstunden */
  @inherit(r)
  @ext(0x87, 0, 0x02)
  @poll(9)
  model OperatingHours {
    parameter: parameter2;
    value: hcd100;
  }

  /** [21-002] Volumenstrom ???? */
  @inherit(r)
  @ext(0x88, 0, 0x02)
  model FlowUnknown1 {
    parameter: parameter1;
    value: flow;
  }

  /** [21-090] Volumenstrom ???? */
  @inherit(r)
  @ext(0x89, 0, 0x02)
  model FlowUnknown2 {
    parameter: parameter1;
    value: flow;
  }

  /** [23-001] Heizenergie kWh */
  @inherit(r)
  @ext(0x8a, 0, 0x02)
  @poll(9)
  model HeatingEnergy_kWh {
    parameter: parameter1;
    value: enerk;
  }

  /** [23-010] Heizenergie MWh */
  @inherit(r)
  @ext(0x8b, 0, 0x02)
  @poll(9)
  model HeatingEnergy_MWh {
    parameter: parameter1;
    value: enerM;
  }

  /** [23-005] Kühlenergie kWh */
  @inherit(r)
  @ext(0x8c, 0, 0x02)
  @poll(9)
  model CoolingEnergy_kWh {
    parameter: parameter1;
    value: enerk;
  }

  /** [23-012] Kühlenergie MWh */
  @inherit(r)
  @ext(0x8d, 0, 0x02)
  @poll(9)
  model CoolingEnergy_MWh {
    parameter: parameter1;
    value: enerM;
  }

  /** [23-006] Warmwasserenergie kWh */
  @inherit(r)
  @ext(0x8e, 0, 0x02)
  @poll(9)
  model HotWaterEnergy_kWh {
    parameter: parameter1;
    value: enerk;
  }

  /** [23-013] Warmwasserenergie MWh */
  @inherit(r)
  @ext(0x8f, 0, 0x02)
  @poll(9)
  model HotWaterEnergy_MWh {
    parameter: parameter1;
    value: enerM;
  }
}