import "@ebusd/ebus-typespec";
import "../_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
using Ebus.Contrib;

namespace Tem;
alias MF = 0x10; // Ebus.Id.Values_manufacturers.TEM
// Bartl TEM

/** Datentyp */
@values(Values_type)
scalar type extends UCH;

/** Einheit */
@values(Values_unit)
scalar unit extends UCH;

/** Maximum */
scalar maxs extends SIN;

/** Minimum */
scalar mins extends SIN;

/** Maximum (Teiler 10) */
@divisor(10)
scalar maxs_10 extends SIN;

/** Minimum (Teiler 10) */
@divisor(10)
scalar mins_10 extends SIN;

/** Weekday */
scalar wd extends BDY;

/** Range */
scalar range extends SCH;

/** Kommando */
model command {
  tem_p: TEM_P;
  type: type;
  unit: unit;
}

/** Energie */
@unit("kWh")
@divisor(10)
scalar enerk extends SIN;

/** Energie */
@unit("MWh")
scalar enerM extends UIN;

/** Energie */
@unit("l/min")
@divisor(10)
scalar flow extends UIN;

/** Temperatur */
@unit("°C")
scalar temp1 extends SIN;

/** Temperatur */
model temp1_1b {
  @unit("°C")
  value: SCH;
  @maxLength(1) ign: IGN;
}

/** Temperatur (Teiler 2) */
model temp2_1b {
  @unit("°C")
  @divisor(2)
  value: SCH;
  @maxLength(1) ign: IGN;
}

/** Temperatur (Teiler 10) */
@unit("°C")
@divisor(10)
scalar temp10 extends SIN;

/** Temperatur (Teiler 10K) */
@unit("K")
@divisor(10)
scalar temp10K extends SIN;

/** Temperatur (Teiler 2) */
@unit("°C")
@divisor(2)
scalar temp2 extends SIN;

/** Temperatur (Teiler 256) */
@unit("°C")
scalar temp256 extends D2B;

/** Maximum */
scalar max_temp1 extends temp1;

/** Minimum */
scalar min_temp1 extends temp1;

/** Maximum */
model max_temp1_1b {
  @unit("°C")
  value: SCH;
  @maxLength(1) ign: IGN;
}

/** Minimum */
model min_temp1_1b {
  @unit("°C")
  value: SCH;
  @maxLength(1) ign: IGN;
}

/** Maximum */
model max_temp2_1b {
  @unit("°C")
  @divisor(2)
  value: SCH;
  @maxLength(1) ign: IGN;
}

/** Minimum */
model min_temp2_1b {
  @unit("°C")
  @divisor(2)
  value: SCH;
  @maxLength(1) ign: IGN;
}

/** Maximum */
scalar max_temp10 extends temp10;

/** Minimum */
scalar min_temp10 extends temp10;

/** Maximum */
scalar max_temp10K extends temp10K;

/** Minimum */
scalar min_temp10K extends temp10K;

/** Maximum */
scalar max_temp2 extends temp2;

/** Minimum */
scalar min_temp2 extends temp2;

/** Maximum */
scalar max_temp256 extends temp256;

/** Minimum */
scalar min_temp256 extends temp256;

/** Maximum */
scalar max_time extends MIN;

/** Minimum */
scalar min_time extends MIN;

/** Maximum */
model max_wd {
  wd: wd;
  @maxLength(1) ign: IGN;
}

/** Minimum */
model min_wd {
  wd: wd;
  @maxLength(1) ign: IGN;
}

/** Maximum */
model max_range {
  range: range;
  @maxLength(1) ign: IGN;
}

/** Minimum */
model min_range {
  range: range;
  @maxLength(1) ign: IGN;
}

/** Parameter */
model parameter1 {
  command: command;
  max: maxs;
  min: mins;
}

/** Parameter10 */
model parameter1_10 {
  command: command;
  max: maxs_10;
  min: mins_10;
}

/** Parameter */
model parameter2 {
  command: command;
  uch: UCH;
  uch_1: UCH;
}

/** ParameterTemp1 */
model parameter_temp1 {
  command: command;
  max: max_temp1;
  min: min_temp1;
}

/** ParameterTemp1 */
model parameter_temp1_1b {
  command: command;
  max: max_temp1_1b;
  min: min_temp1_1b;
}

/** ParameterTemp1 */
model parameter_temp2_1b {
  command: command;
  max: max_temp2_1b;
  min: min_temp2_1b;
}

/** ParameterTemp10 */
model parameter_temp10 {
  command: command;
  max: max_temp10;
  min: min_temp10;
}

/** ParameterTemp10K */
model parameter_temp10K {
  command: command;
  max: max_temp10K;
  min: min_temp10K;
}

/** ParameterTemp2 */
model parameter_temp2 {
  command: command;
  max: max_temp2;
  min: min_temp2;
}

/** ParameterTemp256 */
model parameter_temp256 {
  command: command;
  max: max_temp256;
  min: min_temp256;
}

/** ParameterTime */
model parameter_time {
  command: command;
  max: max_time;
  min: min_time;
}

/** ParameterWeekday */
model parameter_wd {
  command: command;
  max: max_wd;
  min: min_wd;
}

/** ParameterRange */
model parameter_range {
  command: command;
  max: max_range;
  max_1: min_range;
}

/** Binary Time */
scalar btime extends BTI;

/** Binary Date */
scalar bdate extends BDA;

/** Status */
scalar status extends UIN;

@values(Values_temp)
scalar status_temp extends status;

@values(Values_status_1)
scalar status1 extends status;

@values(Values_status_14)
scalar status14 extends status;

@values(Values_status_15)
scalar status15 extends status;

@values(Values_status_23)
scalar status23 extends status;

@values(Values_status_25)
scalar status25 extends status;

@values(Values_status_39)
scalar status39 extends status;

/** Betriebsstunden (Teiler 10) */
@unit("h")
@divisor(100)
scalar hcd100 extends HCD;

/** Zeitprogramm 2 Stunden */
model tp_2h {
  bi: BI0;
  bi_1: BI1;
  bi_2: BI2;
  bi_3: BI3;
  bi_4: BI4;
  bi_5: BI5;
  bi_6: BI6;
  bi_7: BI7;
}

/** Zeitprogramm 8 Stunden */
model tp_8h {
  tp_2h: tp_2h;
  tp_2h_1: tp_2h;
  tp_2h_2: tp_2h;
  tp_2h_3: tp_2h;
}

/** Zeitprogramm 20 Stunden */
model tp_20h {
  tp_2h: tp_2h;
  tp_2h_1: tp_2h;
  tp_2h_2: tp_2h;
  tp_2h_3: tp_2h;
  tp_2h_4: tp_2h;
  tp_2h_5: tp_2h;
  tp_2h_6: tp_2h;
  tp_2h_7: tp_2h;
  tp_2h_8: tp_2h;
  tp_2h_9: tp_2h;
}

/** Modus Zeitprogramm */
model tp_mode {
  uch: UCH;
  uch_1: UCH;
  uch_2: UCH;
  uch_3: UCH;
  uch_4: UCH;
  uch_5: UCH;
  uch_6: UCH;
  uch_7: UCH;
  uch_8: UCH;
  @maxLength(1) ign: IGN;
}

/** Zeitprogramm Woche */
model tp_week {
  tp_20h: tp_20h;
  tp_20h_1: tp_20h;
  tp_20h_2: tp_20h;
  tp_20h_3: tp_20h;
  tp_20h_4: tp_20h;
  tp_20h_5: tp_20h;
  tp_20h_6: tp_20h;
  tp_20h_7: tp_20h;
  tp_8h: tp_8h;
}

/** Zeitprogramm komplett */
model tp_all {
  tp_mode: tp_mode;
  tp_20h: tp_20h;
  tp_20h_1: tp_20h;
  tp_20h_2: tp_20h;
  tp_20h_3: tp_20h;
  tp_20h_4: tp_20h;
  tp_20h_5: tp_20h;
  tp_20h_6: tp_20h;
  tp_20h_7: tp_20h;
  tp_8h: tp_8h;
}

enum Values_type {
  SIN2: 0x00,
  SCH2: 0x01,
  on_off: 0x02,
  UIN: 0x03,
  SIN: 0x04,
  selection: 0x09,
  SIN10: 0x0d,
  HCD: 0x1d,
  NTS: 0x1e, /* ??? */
  Dauer: 0x40,
  TemperaturSchwelle: 0x4d,
  temp10: 0x8d, /* Solltemperatur */
  range: 0xc0,
}

enum Values_unit {
  none: 0x00,
  _C: 0x02,
  K: 0x04,
  __0: 0x08,
  h: 0x0a,
  min: 0x0c,
  kW: 0x10,
  kWh: 0x12,
  dd_mm_yyyy: 0x28, /* Type: DAY */
  hh_mm: 0x2a, /* Type: MIN */
  m3_h: 0x34, /** m³/h */
  MWh: 0x3c,
}

enum Values_temp {
  Abgeschaltet: 0,
  Normal_Ladebetrieb: 1,
  Komfort_Ladebetrieb: 2,
  Zwangsdrosselung: 3,
  Zwangsladung: 4,
  Stoerung: 5,
  Spar_Ladebetrieb: 8,
  Elektro_Nachladung: 10,
  Ladungsabbruch: 11,
}

enum Values_status_1 {
  Abgeschaltet: 0,
  Heizbetrieb: 1,
  Vorlaufzeit_Heizbetrieb: 2,
  Extern_gesperrt: 3,
  Kuehlbetrieb: 4,
  Vorlaufzeit_Kuehlbetrieb: 5,
  Vorlaufzeit_Abtaubetrieb: 6,
  Abtaubetrieb: 7,
  Stoerung: 8,
  Abtropfen: 9,
  Abtausperrzeit: 10,
  Abtau_Vorheizung: 11,
  Abtauen_1: 12,
  Abtauen_2: 13,
  Abtauen_3: 14,
  Alarm: 15,
  Stoerung_2: 16,
  Blockiert: 17,
  TWVmax_Abschaltung: 21,
  TWVsoll_Abschaltgun: 22,
  TQEmax_Abschaltung: 23,
  TQAmin_Abschaltung: 24,
  Bivalentabschaltung: 26,
  Minimale_Auszeit: 28,
  Minimale_Einzeit: 29,
  Passivkuehlung: 36,
  Heizbetrieb_angefordert: 37,
}

enum Values_status_14 {
  keine_Ladung: 0,
  Automatik: 1,
  Normaltemperatur: 2,
  Gemae_Fuehlerkreis: 5,
}

enum Values_status_15 {
  nicht_aktiv: 0,
  mit_Ladepumpe: 1,
  mit_Umlenkventil: 2,
  mit_Ladepumpe_und_Zirkulationspumpe: 3,
  mit_Umlenkventil_und_Zirkulationspumpe: 4,
}

enum Values_status_23 {
  Abgeschaltet: 0,
  Normal_Heizbetrieb: 1,
  Spar_Heizbetrieb: 3,
  Frostschutzbetrieb: 4,
  Zwangsabnahme: 5,
  Zwangsdrosselung: 6,
  Ferienbetrieb: 7,
  Partybetrieb: 8,
  Normal_Kuehlbetrieb: 9,
  Spar_Kuehlbetrieb: 11,
  Stoerung: 12,
  Handbetrieb: 13,
  Schutz_Kuehlbetrieb: 14,
  Partybetrieb_Kuehlen: 15,
  Austrocknung_Aufheizphase: 16,
  Austrocknung_Stationaerphase: 17,
  Austrocknung_Abkuehlphase: 18,
  Austrocknung_Endphase: 19,
}

enum Values_status_25 {
  Automatikbetrieb_1: 1,
  Automatikbetrieb_2: 2,
  Automatikbetrieb_3: 3,
  Normalbetrieb: 4,
  Sparbetrieb: 5,
  Standbybetrieb_WW_frei: 6,
  Handbetrieb_Heizen: 7,
  Handbetrieb_Kuehlen: 8,
}

enum Values_status_39 {
  Notbetrieb_reduziert: 1,
  Notbetrieb_normal: 3,
}
