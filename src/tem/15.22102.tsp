import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Tem;

// MF=TEM;ID=22102;SW=0472;HW=0110  (Ochsner OTE 2.0)

namespace ochsner {
  /** operation */
  namespace o {
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
    model FlowTempGenerator {
      parameter: parameter_temp10;
      value: temp10;
    }

    /** [00-008] Rücklauftemperatur Wärmeerzeuger */
    @inherit(r)
    @ext(0x88, 0, 0x40)
    model ReturnTempGenerator {
      parameter: parameter_temp10;
      value: temp10;
    }

    /** [00-096] Vorlauftemperatur Anlage */
    @inherit(r)
    @ext(0xe0, 0, 0x40)
    model FlowTemp {
      parameter: parameter_temp10;
      value: temp10;
    }
  }

  /** config */
  namespace c {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x02)
    model r {}

    /** [02-053] Status Wärmeerzeugerregelung */
    @inherit(r)
    @ext(0xb5, 0, 0x40)
    model Status {
      parameter: parameter1;
      value: status1;
    }

    /** [02-050] ???? */
    @inherit(r)
    @ext(0xb2, 0, 0x40)
    model UnknownValue0 {
      parameter: parameter1;
      value: status;
    }
    
    /** [02-068] ??? */
    @inherit(r)
    @ext(0xc4, 0, 0x40)
    model UnknownValue1 {
      parameter: parameter1;
      value: SIN;
    }
    /** [02-069] ??? */
    @inherit(r)
    @ext(0xc5, 0, 0x40)
    model UnknownValue2 {
      parameter: parameter1;
      value: SIN;
    }

    /** [02-070] Datum */
    @inherit(r)
    @ext(0xc6, 0, 0x40)
    model Date {
      parameter: parameter1;
      value: DAY;
    }

    /** [02-071] ??? */
    @inherit(r)
    @ext(0xc7, 0, 0x40)
    model UnknownValue4 {
      parameter: parameter1;
      value: SIN;
    }

    /** [02-072] Uhrzeit */
    @inherit(r)
    @ext(0xc8, 0, 0x40)
    model Time {
      parameter: parameter_time;
      value: MIN;
    }

    /** [02-073] Wochentag */
    @inherit(r)
    @ext(0xc9, 0, 0x40)
    model Weekday {
      parameter: parameter_wd;
      value: BDY;
    }
  }

  /** unknown2 */
  namespace u2 {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x04)
    model r {}

    /** [04-001] ??? */
    @inherit(r)
    @ext(0x81, 0, 0x40)
    model UnknownValue0 {
      parameter: command;
      value: NTS;
    }
    /** [04-005] ??? */
    @inherit(r)
    @ext(0x85, 0, 0x40)
    model UnknownValue1 {
      parameter: command;
      value: NTS;
    }
  }

  /** status */
  namespace s {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x06)
    model r {}

    /** [06-014] Betriebsart Notbetrieb */
    @inherit(r)
    @ext(0x8e, 0, 0x40)
    model EmergencyMode {
      parameter: parameter1;
      value: status39;
    }
  }

  /** hot water */
  namespace hw {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x65)
    model r {}

    /** [05-051] Normal Warmwassertemperatur */
    @inherit(r)
    @ext(0x80, 0, 0xe)
    model NormalHotWaterTemp {
      parameters: parameter_temp10;

      /** Mit dieser Einstellung wird der Warmwasser Sollwert eingestellt */
      status: temp10;
    }

    /** [05-076] Applikationstyp Warmwasserbereitung */
    @inherit(r)
    @ext(0x81, 0, 0xe)
    model HotWaterAppType {
      parameters: parameter1;

      /** Mit dieser Einstellung kann ein entsprechend definierter Applikationstyp vorgewählt werden */
      status: status15;
    }
  }

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
    model DesiredRoomTemp {
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
    model DesiredFlowTemp {
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

  /** hot water circuit */
  namespace hwc {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x79)
    model r {}

    /** [02-052] Status Warmwasserregelung */
    @inherit(r)
    @ext(0x80, 0, 0x0e)
    @poll(1)
    model Status {
      parameter: parameter1;
      value: status_temp;
    }

    /** [00-004] Warmwassertemperatur */
    @inherit(r)
    @ext(0x81, 0, 0x0e)
    @poll(9)
    model HotWaterTemp {
      parameter: parameter_temp10;

      /** Obere Warmwasser Speichertemperatur */
      value: temp10;
    }

    /** [01-004] Warmwassertemperatur Sollwert */
    @inherit(r)
    @ext(0x82, 0, 0x0e)
    model DesiredHotWaterTemp {
      parameter: parameter_temp10;

      /** Berechneter Sollwert für die Warmwassertemperatur */
      value: temp10;
    }
  }

  /** generator */
  namespace g {
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
    model DesiredFlowTemp {
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
}