import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Tem;

// MF=TEM;ID=22102;SW=0472;HW=0110  (Ochsner OTE 2.0)

namespace ochsner {
  @zz(0x15)
  @base(0x06, 0x21)
  model r {}

  @write
  @zz(0x15)
  @base(0x06, 0x21)
  model w {}

  namespace _00 {  
      /** [00-000] Außentemperatur */
    @inherit(r)
    @ext(0x00, 0x80, 0x00, 0x40)
    @poll(9)
    model OutsideTemp {
      parameter: parameter_temp10;
      value: temp10;
    }

    /** [00-000] Außentemperatur */
    @inherit(r)
    @ext(0x00, 0x80, 0x00, 0x4e)
    model OutsideTemp_ {
      parameter: parameter_temp10;
      value: temp10;
    }

    /** [00-000] Außentemperatur */
    @inherit(r)
    @ext(0x77, 0x81, 0x00, 0x08)
    model OutsideTemp__ {
      parameter: parameter_temp10;
      value: temp10;
    }
    
    /** [00-001] Raumtemperatur */
    @inherit(r)
    @ext(0x77, 0x83, 0x00, 0x08)
    @poll(9)
    model RoomTemp {
      parameter: parameter_temp10;
      value: temp10;
    }

    /** [00-002] Heizkreis Vorlauftemperatur */
    @inherit(r)
    @ext(0x77, 0x85, 0x00, 0x08)
    model FlowTempHeating {
      parameter: parameter_temp10;
      value: temp10;
    }

    /** [00-004] Warmwassertemperatur */
    @inherit(r)
    @ext(0x00, 0x84, 0x00, 0x40)
    @poll(9)
    model HotWaterTemp {
      parameter: parameter_temp10;

      /** Obere Warmwasser Speichertemperatur */
      value: temp10;
    }

    /** [00-004] Warmwassertemperatur */
    @inherit(r)
    @ext(0x00, 0x84, 0x00, 0x4e)
    model HotWaterTemp_ {
      parameter: parameter_temp10;

      /** Obere Warmwasser Speichertemperatur */
      value: temp10;
    }

    /** [00-004] Warmwassertemperatur */
    @inherit(r)
    @ext(0x79, 0x81, 0x00, 0x0e)
    model HotWaterTemp__ {
      parameter: parameter_temp10;

      /** Obere Warmwasser Speichertemperatur */
      value: temp10;
    }

    /** [00-007] Vorlauftemperatur Wärmeerzeuger */
    @inherit(r)
    @ext(0x00, 0x87, 0x00, 0x40)
    model FlowTempGenerator {
      parameter: parameter_temp10;
      value: temp10;
    }

    /** [00-007] Vorlauftemperatur Wärmeerzeuger */
    @inherit(r)
    @ext(0x7d, 0x81, 0x00, 0x02)
    model FlowTempGenerator_ {
      parameter: parameter_temp10;
      value: temp10;
    }      

    /** [00-008] Rücklauftemperatur Wärmeerzeuger */
    @inherit(r)
    @ext(0x00, 0x88, 0x00, 0x40)
    model ReturnTempGenerator {
      parameter: parameter_temp10;
      value: temp10;
    }

    /** [00-008] Rücklauftemperatur Wärmeerzeuger */
    @inherit(r)
    @ext(0x7d, 0x83, 0x00, 0x02)
    model ReturnTempGenerator_ {
      parameter: parameter_temp10;
      value: temp10;
    }

    /** [00-058] Relative Feuchte */
    @inherit(r)
    @ext(0x77, 0x87, 0x00, 0x08)
    @poll(9)
    model Humidity {
      parameter: parameter1;

      /** Gemessene Relative Feuchtigkeit */
      value: SIN;
    }

    /** [00-070] Austrittstemperatur Wärmequelle */
    @inherit(r)
    @ext(0x7d, 0x84, 0x00, 0x02)
    model OutletTemp {
      parameter: parameter_temp10;
      value: temp10;
    }

    /** [00-071] Eintrittstemperatur Wärmequelle */
    @inherit(r)
    @ext(0x7d, 0x85, 0x00, 0x02)
    model InletTemp {
      parameter: parameter_temp10;
      value: temp10;
    }

    /** [00-096] Vorlauftemperatur Anlage */
    @inherit(r)
    @ext(0x00, 0xe0, 0x00, 0x40)
    model FlowTemp {
      parameter: parameter_temp10;
      value: temp10;
    }
  }

  namespace _01 {    
    /** [01-001] Raumtemperatur Sollwert */
    @inherit(r)
    @ext(0x77, 0x84, 0x00, 0x08)
    @poll(9)
    model DesiredRoomTemp {
      parameter: parameter_temp10;

      /** Berechneter Sollwert für die Raumtemperatur */
      value: temp10;
    }

    /** [01-002] Heizkreis Vorlauftemperatur Sollwert */
    @inherit(r)
    @ext(0x77, 0x86, 0x00, 0x08)
    model DesiredFlowTempHeating {
      parameter: parameter_temp10;

      /** Berechneter Sollwert für die Heizkreis Vorlauftemperatur */
      value: temp10;
    }

    /** [01-004] Warmwassertemperatur Sollwert */
    @inherit(r)
    @ext(0x79, 0x82, 0x00, 0x0e)
    model DesiredHotWaterTemp {
      parameter: parameter_temp10;

      /** Berechneter Sollwert für die Warmwassertemperatur */
      value: temp10;
    }

    /** [01-007] Wärmeerzeuger Vorlauftemperatur Sollwert */
    @inherit(r)
    @ext(0x7d, 0x82, 0x00, 0x02)
    model DesiredFlowTempGenerator {
      parameter: parameter_temp10;

      /** Berechneter Sollwert für die Wärmeerzeuger Vorlauftemperatur */
      value: temp10;
    }  

    /** [01-066] Warmwasser Ladepumpe */
    @inherit(r)
    @ext(0x01, 0xc2, 0x00, 0x4e)
    model HotWaterChargePump {
      parameter: parameter1;

      /** Stellgrösse für eine Warmwasser Ladepumpe oder Umlenkventil */
      value: SCH;
    }  
  }

  namespace _02 {
    /** [02-020] Außentemperatur Mittelwert */
    @inherit(r)
    @ext(0x77, 0x82, 0x00, 0x08)
    model AvgOutsideTemp {
      parameter: parameter_temp10;
      value: temp10;
    }
    
    /** [02-050] ???? */
    @inherit(r)
    @ext(0x02, 0xb2, 0x00, 0x40)
    model UnknownValue0 {
      parameter: parameter1;
      value: status;
    }

    /** [02-051] Status Heizkreisregelung */
    @inherit(r)
    @ext(0x77, 0x80, 0x00, 0x08)
    @poll(1)
    model HeatingStatus {
      parameter: parameter1;
      value: status23;
    }

    /** [02-052] Status Warmwasserregelung */
    @inherit(r)
    @ext(0x79, 0x80, 0x00, 0x0e)
    @poll(1)
    model HotWaterStatus {
      parameter: parameter1;
      value: status_temp;
    }

    /** [02-053] Status Wärmeerzeugerregelung */
    @inherit(r)
    @ext(0x02, 0xb5, 0x00, 0x40)
    @poll(1)
    model GeneratorStatus {
      parameter: parameter1;
      value: status1;
    }

    /** [02-053] Status Wärmeerzeugerregelung */
    @inherit(r)
    @ext(0x7d, 0x80, 0x00, 0x02)
    model GeneratorStatus_ {
      parameter: parameter1;
      value: status1;
    }
    
    /** [02-068] ??? */
    @inherit(r)
    @ext(0x02, 0xc4, 0x00, 0x40)
    model UnknownValue1 {
      parameter: parameter1;
      value: SIN;
    }

    /** [02-069] ??? */
    @inherit(r)
    @ext(0x02, 0xc5, 0x00, 0x40)
    model UnknownValue2 {
      parameter: parameter1;
      value: SIN;
    }

    /** [02-070] Datum */
    @inherit(r)
    @ext(0x02, 0xc6, 0x00, 0x40)
    model Date {
      parameter: parameter1;
      value: DAY;
    }

    /** [02-071] ??? */
    @inherit(r)
    @ext(0x02, 0xc7, 0x00, 0x40)
    model UnknownValue3 {
      parameter: parameter1;
      value: SIN;
    }

    /** [02-072] Uhrzeit */
    @inherit(r)
    @ext(0x02, 0xc8, 0x00, 0x40)
    model Time {
      parameter: parameter_time;
      value: MIN;
    }

    /** [02-073] Wochentag */
    @inherit(r)
    @ext(0x02, 0xc9, 0x00, 0x40)
    model Weekday {
      parameter: parameter_wd;
      value: BDY;
    }

    /** [02-080] Schaltzyklen */
    @inherit(r)
    @ext(0x7d, 0x86, 0x00, 0x02)
    @poll(9)
    model SwitchingCycles {
      parameter: parameter2;
      value: HCD;
    }

    /** [02-081] Betriebsstunden */
    @inherit(r)
    @ext(0x7d, 0x87, 0x00, 0x02)
    @poll(9)
    model OperatingHours {
      parameter: parameter2;
      value: hcd100;
    }
  }

  namespace _03 {
    /** [03-000] Raumschutztemperatur */
    @inherit(r)
    @ext(0x63, 0x80, 0x00, 0x08)
    model RoomProtectionTemp {
      parameter: parameter_temp10;

      /** Die Raumschutztemperatur ist im Standby-, Ferien- und Sommerbetrieb als Raumsollwert wirksam */
      value: temp10;
    }

    /** [03-001] Fußpunkt Vorlauftemperatur Heizbetrieb */
    @inherit(r)
    @ext(0x63, 0x81, 0x00, 0x08)
    model BaseFlowTempHeating {
      parameter: parameter_temp10;

      /** Die Fußpunkttemperatur ist die Vorlauf Solltemperatur für eine Raumtemperatur von 20 °C im Heizbetrieb beim Außentemperatur Fußpunkt */
      value: temp10;
    }

    /** [03-002] Heizgrenze Sparbetrieb */
    @inherit(r)
    @ext(0x63, 0x82, 0x00, 0x08)
    model EnergySavingHeatingLimit {
      parameter: parameter_temp10;

      /** Im Automatikbetrieb kann für Sparbetrieb hier eine eigenen Heizgrenze eingestellt werden */
      value: temp10;
    }

    /** [03-012] Auslegungs-Außentemperatur Heizbetrieb */
    @inherit(r)
    @ext(0x63, 0x83, 0x00, 0x08)
    model DesignOutsideTempHeating {
      parameter: parameter_temp1_1b;

      /** Mir dieser Einstellung wird der Klimapunkt auf der Außentemperaturachse bestimmt */
      value: temp1_1b;
    }

    /** [03-013] Auslegungs-Vorlauftemperatur Heizbetrieb */
    @inherit(r)
    @ext(0x63, 0x84, 0x00, 0x08)
    model DesignFlowTempHeating {
      parameter: parameter_temp2;

      /** Mit diesem Einsteller wird der Sollwert für die Vorlauftemperatur für 20 °C Raumtemperatur am Klimapunkt eingestellt */
      value: temp2;
    }
                  
    /** [03-021] Heizgrenze Normalbetrieb */
    @inherit(r)
    @ext(0x63, 0x85, 0x00, 0x08)
    model NormalHeatingLimit {
      parameter: parameter_temp10;

      /** Mit dieser Einstellung wird die Heizgrenze für eine Raumtemperatur von 20 °C bestimmt */
      value: temp10;
    }

    /** [03-036] Kühlgrenze Außentemperatur */
    @inherit(r)
    @ext(0x63, 0x86, 0x00, 0x08)
    model CoolingLimitOutsideTemp {
      parameter: parameter_temp2_1b;

      /** Mit der Einstellung wird bestimmt, ab welcher mittlerer Außentemperatur ein Kühlfunktion freigegeben wird */
      value: temp2_1b;
    }

    /** [03-043] Fusspunkt Vorlauftemperatur Kühlbetrieb */
    @inherit(r)
    @ext(0x63, 0x87, 0x00, 0x08)
    model BaseFlowTempCooling {
      parameter: parameter_temp10;

      /** Die Fusspunkttemperatur ist die Vorlauf Solltemperatur für eine Raumtemperatur von 22 °C im Kühlbetrieb beim Aussentemperatur Fusspunkt */
      value: temp10;
    }

    /** [03-044] Einsatzpunkt Sommerkompensation */
    @inherit(r)
    @ext(0x63, 0x88, 0x00, 0x08)
    model ThresholdSummerCompensation {
      parameter: parameter_temp2_1b;

      /** Steigt die Ausssentemperatur über den Einstellwert, steigt der Sollwert für die Raumtemperatur mit der eingestellten Steilheit */
      value: temp2_1b;
    }

    /** [03-045] Steilheit Sommerkompensation */
    @inherit(r)
    @ext(0x63, 0x89, 0x00, 0x08)
    model SteepnessSummerCompensation {
      parameter: parameter1;

      /** Mit der Steilheit wird der Einfluss der Aussentemperaturänderung auf die Raumtemperatursteigung eingestellt */
      @unit("%")
      value: SIN;
    }

    /** [03-047] Auslegungs-Außentemperatur Kühlbetrieb */
    @inherit(r)
    @ext(0x63, 0x8a, 0x00, 0x08)
    model DesignOutsideTempCooling {
      parameter: parameter_temp1_1b;

      /** Mit der Einstellung wird die Aussentemperatur für die Auslegungs Vorlauftemperatur im Kühlbetrieb eingestellt */
      value: temp1_1b;
    }

    /** [03-048] Auslegungs-Vorlauftemperatur Kühlbetrieb */
    @inherit(r)
    @ext(0x03, 0xb0, 0x00, 0x48)
    model DesignFlowTempCooling {
      parameter: parameter_temp2;

      /** Mit dem Einsteller wird die Auslegungs Vorlauftemperatur für Kühlbetrieb eingestellt */
      value: temp2;
    }

    /** [03-048] Auslegungs-Vorlauftemperatur Kühlbetrieb */
    @inherit(r)
    @ext(0x63, 0x8b, 0x00, 0x08)
    model DesignFlowTempCooling_ {
      parameter: parameter_temp2_1b;

      /** Mit dem Einsteller wird die Auslegungs Vorlauftemperatur für Kühlbetrieb eingestellt */
      value: temp2_1b;
    }

    /** [03-050] Betriebswahl Heizung */
    @inherit(r)
    @ext(0x03, 0xb2, 0x00, 0x48)
    model OperatingModeHeating {
      parameter: parameter1;

      /** Mit der Einstellung wir die Betriebswahl des Heizkreises bestimmt */
      value: status25;
    }

    /** [03-051] Normal Raumtemperatur Heizbetrieb */
    @inherit(r)
    @ext(0x03, 0xb3, 0x00, 0x48)
    model NormalRoomTempHeating {
      parameter: parameter_temp10;

      /** Mit dem Einsteller wir der gewünschte Sollwert für die Raumtemperatur im Normal Heizbetrieb gewählt */
      value: temp10;
    }

    /** [03-051] Normal Raumtemperatur Heizbetrieb */
    @inherit(r)
    @ext(0x63, 0x8c, 0x00, 0x08)
    model NormalRoomTempHeating_ {
      parameter: parameter_temp10;

      /** Mit dem Einsteller wir der gewünschte Sollwert für die Raumtemperatur im Normal Heizbetrieb gewählt */
      value: temp10;
    }

    /** [03-053] Spar Raumtemperatur Heizbetrieb */
    @inherit(r)
    @ext(0x03, 0xb5, 0x00, 0x48)
    model EnergySavingRoomTempHeating {
      parameter: parameter_temp10;

      /** Mit dem Einsteller wir der gewünschte Sollwert für die Raumtemperatur im Spar Heizbetrieb gewählt */
      value: temp10;
    }

    /** [03-053] Spar Raumtemperatur Heizbetrieb */
    @inherit(r)
    @ext(0x63, 0x8d, 0x00, 0x08)
    model EnergySavingRoomTempHeating_ {
      parameter: parameter_temp10;

      /** Mit dem Einsteller wir der gewünschte Sollwert für die Raumtemperatur im Spar Heizbetrieb gewählt */
      value: temp10;
    }

    /** [03-054] Normal Raumtemperatur Kühlbetrieb */
    @inherit(r)
    @ext(0x03, 0xb6, 0x00, 0x48)
    model NormalRoomTempCooling {
      parameter: parameter_temp10;

      /** Mit dem Einsteller wir der gewünschte Sollwert für die Raumtemperatur im Normal Kühlbetrieb gewählt */
      value: temp10;
    }
                  
    /** [03-054] Normal Raumtemperatur Kühlbetrieb */
    @inherit(r)
    @ext(0x63, 0x8e, 0x00, 0x08)
    model NormalRoomTempCooling_ {
      parameter: parameter_temp10;

      /** Mit dem Einsteller wir der gewünschte Sollwert für die Raumtemperatur im Normal Kühlbetrieb gewählt */
      value: temp10;
    }

    /** [03-056] Spar Raumtemperatur Kühlbetrieb */
    @inherit(r)
    @ext(0x03, 0xb8, 0x00, 0x48)
    model EnergySavingRoomTempCooling {
      parameter: parameter_temp10;

      /** Mit dem Einsteller wir der gewünschte Sollwert für die Raumtemperatur im Spar Kühlbetrieb gewählt */
      value: temp10;
    }

    /** [03-056] Spar Raumtemperatur Kühlbetrieb */
    @inherit(r)
    @ext(0x63, 0x8f, 0x00, 0x08)
    model EnergySavingRoomTempCooling_ {
      parameter: parameter_temp10;

      /** Mit dem Einsteller wir der gewünschte Sollwert für die Raumtemperatur im Spar Kühlbetrieb gewählt */
      value: temp10;
    }

    /** [03-058] Behaglichkeit */
    @inherit(r)
    @ext(0x03, 0xba, 0x00, 0x48)
    model ComfortTemp {
      parameter: parameter_temp10K;

      /** Mit der Behaglichkeit wird der Sollwert der Raumtemperatur um den Einstellwert verändert */
      value: temp10K;
    }
  }
  
  namespace _04 {
    /** [04-001] ??? */
    @inherit(r)
    @ext(0x04, 0x81, 0x00, 0x40)
    model UnknownValue4 {
      parameter: command;
      value: NTS;
    }

    /** [04-005] Funktionsname */
    @inherit(r)
    @ext(0x04, 0x85, 0x00, 0x40)
    model FunctionName {
      parameter: command;
      value: NTS;
    }
  }

  namespace _05 {
    /** [05-050] Betriebswahl Warmwasser */
    @inherit(r)
    @ext(0x05, 0xb2, 0x00, 0x4e)
    model OperatingModeHotWater {
      parameter: parameter1;

      /** Betriebswahl Warmwasserfunktion */
      value: status14;
    }
    /** [05-050] Betriebswahl Warmwasser */
    @inherit(w)
    @ext(0x05, 0xb2, 0x00, 0x4e)
    model SetOperatingModeHotWater {
      /** Betriebswahl Warmwasserfunktion */
      value: status14;
    }

    /** [05-051] Normal Warmwassertemperatur */
    @inherit(r)
    @ext(0x05, 0xb3, 0x00, 0x4e)
    model NormalHotWaterTemp {
      parameter: parameter_temp10;

      /** Mit dieser Einstellung wird der Warmwasser Sollwert eingestellt */
      value: temp10;
    }

    /** [05-051] Normal Warmwassertemperatur */
    @inherit(r)
    @ext(0x65, 0x80, 0x00, 0x0e)
    model NormalHotWaterTemp_ {
      parameter: parameter_temp10;

      /** Mit dieser Einstellung wird der Warmwasser Sollwert eingestellt */
      value: temp10;
    }

    /** [05-051] Normal Warmwassertemperatur */
    @inherit(w)
    @ext(0x05, 0xb3, 0x00, 0x4e)
    model SetNormalHotWaterTemp {
      /** Mit dieser Einstellung wird der Warmwasser Sollwert eingestellt */
      value: temp10;
    }

    /** [05-051] Normal Warmwassertemperatur */
    @inherit(w)
    @ext(0x65, 0x80, 0x00, 0x0e)
    model SetNormalHotWaterTemp_ {
      /** Mit dieser Einstellung wird der Warmwasser Sollwert eingestellt */
      value: temp10;
    }
    
    /** [05-061] ??? */
    @inherit(r)
    @ext(0x05, 0xbd, 0x00, 0x4e)
    model UnknownValue5 {
      parameter: command;
      value: NTS;
    }

    /** [05-062] ??? */
    @inherit(r)
    @ext(0x05, 0xbe, 0x00, 0x4e)
    model UnknownValue6 {
      parameter: command;
      value: NTS;
    }

    /** [05-076] Applikationstyp Warmwasserbereitung */
    @inherit(r)
    @ext(0x65, 0x81, 0x00, 0x0e)
    model HotWaterAppType {
      parameter: parameter1;

      /** Mit dieser Einstellung kann ein entsprechend definierter Applikationstyp vorgewählt werden */
      value: status15;
    }
  }
  
  namespace _06 {
    /** [06-014] Betriebsart Notbetrieb */
    @inherit(r)
    @ext(0x06, 0x8e, 0x00, 0x40)
    model EmergencyMode {
      parameter: parameter1;
      value: status39;
    }
  }

  namespace _21 {
    /** [21-002] Volumenstrom Wärmenutzung */
    @inherit(r)
    @ext(0x7d, 0x88, 0x00, 0x02)
    model FlowUtilization {
      parameter: parameter1;
      value: flow;
    }

    /** [21-090] Volumenstrom Wärmequelle */
    @inherit(r)
    @ext(0x7d, 0x89, 0x00, 0x02)
    model FlowSource {
      parameter: parameter1;
      value: flow;
    }
  }

  namespace _23 {
    /** [23-001] Heizenergie kWh */
    @inherit(r)
    @ext(0x7d, 0x8a, 0x00, 0x02)
    @poll(9)
    model HeatingEnergy_kWh {
      parameter: parameter1;
      value: enerk;
    }

    /** [23-010] Heizenergie MWh */
    @inherit(r)
    @ext(0x7d, 0x8b, 0x00, 0x02)
    @poll(9)
    model HeatingEnergy_MWh {
      parameter: parameter1;
      value: enerM;
    }

    /** [23-005] Kühlenergie kWh */
    @inherit(r)
    @ext(0x7d, 0x8c, 0x00, 0x02)
    @poll(9)
    model CoolingEnergy_kWh {
      parameter: parameter1;
      value: enerk;
    }

    /** [23-012] Kühlenergie MWh */
    @inherit(r)
    @ext(0x7d, 0x8d, 0x00, 0x02)
    @poll(9)
    model CoolingEnergy_MWh {
      parameter: parameter1;
      value: enerM;
    }

    /** [23-006] Warmwasserenergie kWh */
    @inherit(r)
    @ext(0x7d, 0x8e, 0x00, 0x02)
    @poll(9)
    model HotWaterEnergy_kWh {
      parameter: parameter1;
      value: enerk;
    }

    /** [23-013] Warmwasserenergie MWh */
    @inherit(r)
    @ext(0x7d, 0x8f, 0x00, 0x02)
    @poll(9)
    model HotWaterEnergy_MWh {
      parameter: parameter1;
      value: enerM;
    }
  }
}