import 'package:equatable/equatable.dart';

import 'ao.dart';
import 'ar.dart';
import 'at.dart';
import 'au.dart';
import 'ba.dart';
import 'be.dart';
import 'bf.dart';
import 'bg.dart';
import 'bo.dart';
import 'br.dart';
import 'by.dart';
import 'bz.dart';
import 'ca.dart';
import 'cd.dart';
import 'ch.dart';
import 'cl.dart';
import 'cm.dart';
import 'co.dart';
import 'cr.dart';
import 'cv.dart';
import 'cy.dart';
import 'cz.dart';
import 'de.dart';
import 'dk.dart';
import 'ec.dart';
import 'ee.dart';
import 'eg.dart';
import 'es.dart';
import 'fi.dart';
import 'fr.dart';
import 'gb.dart';
import 'gg.dart';
import 'gh.dart';
import 'gi.dart';
import 'gr.dart';
import 'gt.dart';
import 'hk.dart';
import 'hn.dart';
import 'hr.dart';
import 'hu.dart';
import 'id.dart';
import 'ie.dart';
import 'il.dart';
import 'in.dart';
import 'it.dart';
import 'jp.dart';
import 'kr.dart';
import 'lt.dart';
import 'lu.dart';
import 'lv.dart';
import 'mc.dart';
import 'md.dart';
import 'me.dart';
import 'mg.dart';
import 'mk.dart';
import 'ml.dart';
import 'mt.dart';
import 'mu.dart';
import 'mw.dart';
import 'mx.dart';
import 'my.dart';
import 'mz.dart';
import 'ni.dart';
import 'nl.dart';
import 'no.dart';
import 'nz.dart';
import 'pe.dart';
import 'ph.dart';
import 'pl.dart';
import 'pt.dart';
import 'py.dart';
import 'ro.dart';
import 'rs.dart';
import 'ru.dart';
import 'se.dart';
import 'sg.dart';
import 'si.dart';
import 'sk.dart';
import 'td.dart';
import 'th.dart';
import 'tr.dart';
import 'tw.dart';
import 'tz.dart';
import 'ua.dart';
import 'ug.dart';
import 'us.dart';
import 've.dart';
import 'za.dart';
import 'zw.dart';

class Results extends Equatable {
  final Ao? ao;
  final Ar? ar;
  final At? at;
  final Au? au;
  final Ba? ba;
  final Be? be;
  final Bf? bf;
  final Bg? bg;
  final Bo? bo;
  final Br? br;
  final By? by;
  final Bz? bz;
  final Ca? ca;
  final Cd? cd;
  final Ch? ch;
  final Cl? cl;
  final Cm? cm;
  final Co? co;
  final Cr? cr;
  final Cv? cv;
  final Cy? cy;
  final Cz? cz;
  final De? de;
  final Dk? dk;
  final Ec? ec;
  final Ee? ee;
  final Eg? eg;
  final Es? es;
  final Fi? fi;
  final Fr? fr;
  final Gb? gb;
  final Gg? gg;
  final Gh? gh;
  final Gi? gi;
  final Gr? gr;
  final Gt? gt;
  final Hk? hk;
  final Hn? hn;
  final Hr? hr;
  final Hu? hu;
  final Id? id;
  final Ie? ie;
  final Il? il;
  final In? resultsIn;
  final It? it;
  final Jp? jp;
  final Kr? kr;
  final Lt? lt;
  final Lu? lu;
  final Lv? lv;
  final Mc? mc;
  final Md? md;
  final Me? me;
  final Mg? mg;
  final Mk? mk;
  final Ml? ml;
  final Mt? mt;
  final Mu? mu;
  final Mw? mw;
  final Mx? mx;
  final My? my;
  final Mz? mz;
  final Ni? ni;
  final Nl? nl;
  final No? no;
  final Nz? nz;
  final Pe? pe;
  final Ph? ph;
  final Pl? pl;
  final Pt? pt;
  final Py? py;
  final Ro? ro;
  final Rs? rs;
  final Ru? ru;
  final Se? se;
  final Sg? sg;
  final Si? si;
  final Sk? sk;
  final Td? td;
  final Th? th;
  final Tr? tr;
  final Tw? tw;
  final Tz? tz;
  final Ua? ua;
  final Ug? ug;
  final Us? us;
  final Ve? ve;
  final Za? za;
  final Zw? zw;

  const Results({
    this.ao,
    this.ar,
    this.at,
    this.au,
    this.ba,
    this.be,
    this.bf,
    this.bg,
    this.bo,
    this.br,
    this.by,
    this.bz,
    this.ca,
    this.cd,
    this.ch,
    this.cl,
    this.cm,
    this.co,
    this.cr,
    this.cv,
    this.cy,
    this.cz,
    this.de,
    this.dk,
    this.ec,
    this.ee,
    this.eg,
    this.es,
    this.fi,
    this.fr,
    this.gb,
    this.gg,
    this.gh,
    this.gi,
    this.gr,
    this.gt,
    this.hk,
    this.hn,
    this.hr,
    this.hu,
    this.id,
    this.ie,
    this.il,
    this.resultsIn,
    this.it,
    this.jp,
    this.kr,
    this.lt,
    this.lu,
    this.lv,
    this.mc,
    this.md,
    this.me,
    this.mg,
    this.mk,
    this.ml,
    this.mt,
    this.mu,
    this.mw,
    this.mx,
    this.my,
    this.mz,
    this.ni,
    this.nl,
    this.no,
    this.nz,
    this.pe,
    this.ph,
    this.pl,
    this.pt,
    this.py,
    this.ro,
    this.rs,
    this.ru,
    this.se,
    this.sg,
    this.si,
    this.sk,
    this.td,
    this.th,
    this.tr,
    this.tw,
    this.tz,
    this.ua,
    this.ug,
    this.us,
    this.ve,
    this.za,
    this.zw,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    ao: json['AO'] == null
        ? null
        : Ao.fromJson(json['AO'] as Map<String, dynamic>),
    ar: json['AR'] == null
        ? null
        : Ar.fromJson(json['AR'] as Map<String, dynamic>),
    at: json['AT'] == null
        ? null
        : At.fromJson(json['AT'] as Map<String, dynamic>),
    au: json['AU'] == null
        ? null
        : Au.fromJson(json['AU'] as Map<String, dynamic>),
    ba: json['BA'] == null
        ? null
        : Ba.fromJson(json['BA'] as Map<String, dynamic>),
    be: json['BE'] == null
        ? null
        : Be.fromJson(json['BE'] as Map<String, dynamic>),
    bf: json['BF'] == null
        ? null
        : Bf.fromJson(json['BF'] as Map<String, dynamic>),
    bg: json['BG'] == null
        ? null
        : Bg.fromJson(json['BG'] as Map<String, dynamic>),
    bo: json['BO'] == null
        ? null
        : Bo.fromJson(json['BO'] as Map<String, dynamic>),
    br: json['BR'] == null
        ? null
        : Br.fromJson(json['BR'] as Map<String, dynamic>),
    by: json['BY'] == null
        ? null
        : By.fromJson(json['BY'] as Map<String, dynamic>),
    bz: json['BZ'] == null
        ? null
        : Bz.fromJson(json['BZ'] as Map<String, dynamic>),
    ca: json['CA'] == null
        ? null
        : Ca.fromJson(json['CA'] as Map<String, dynamic>),
    cd: json['CD'] == null
        ? null
        : Cd.fromJson(json['CD'] as Map<String, dynamic>),
    ch: json['CH'] == null
        ? null
        : Ch.fromJson(json['CH'] as Map<String, dynamic>),
    cl: json['CL'] == null
        ? null
        : Cl.fromJson(json['CL'] as Map<String, dynamic>),
    cm: json['CM'] == null
        ? null
        : Cm.fromJson(json['CM'] as Map<String, dynamic>),
    co: json['CO'] == null
        ? null
        : Co.fromJson(json['CO'] as Map<String, dynamic>),
    cr: json['CR'] == null
        ? null
        : Cr.fromJson(json['CR'] as Map<String, dynamic>),
    cv: json['CV'] == null
        ? null
        : Cv.fromJson(json['CV'] as Map<String, dynamic>),
    cy: json['CY'] == null
        ? null
        : Cy.fromJson(json['CY'] as Map<String, dynamic>),
    cz: json['CZ'] == null
        ? null
        : Cz.fromJson(json['CZ'] as Map<String, dynamic>),
    de: json['DE'] == null
        ? null
        : De.fromJson(json['DE'] as Map<String, dynamic>),
    dk: json['DK'] == null
        ? null
        : Dk.fromJson(json['DK'] as Map<String, dynamic>),
    ec: json['EC'] == null
        ? null
        : Ec.fromJson(json['EC'] as Map<String, dynamic>),
    ee: json['EE'] == null
        ? null
        : Ee.fromJson(json['EE'] as Map<String, dynamic>),
    eg: json['EG'] == null
        ? null
        : Eg.fromJson(json['EG'] as Map<String, dynamic>),
    es: json['ES'] == null
        ? null
        : Es.fromJson(json['ES'] as Map<String, dynamic>),
    fi: json['FI'] == null
        ? null
        : Fi.fromJson(json['FI'] as Map<String, dynamic>),
    fr: json['FR'] == null
        ? null
        : Fr.fromJson(json['FR'] as Map<String, dynamic>),
    gb: json['GB'] == null
        ? null
        : Gb.fromJson(json['GB'] as Map<String, dynamic>),
    gg: json['GG'] == null
        ? null
        : Gg.fromJson(json['GG'] as Map<String, dynamic>),
    gh: json['GH'] == null
        ? null
        : Gh.fromJson(json['GH'] as Map<String, dynamic>),
    gi: json['GI'] == null
        ? null
        : Gi.fromJson(json['GI'] as Map<String, dynamic>),
    gr: json['GR'] == null
        ? null
        : Gr.fromJson(json['GR'] as Map<String, dynamic>),
    gt: json['GT'] == null
        ? null
        : Gt.fromJson(json['GT'] as Map<String, dynamic>),
    hk: json['HK'] == null
        ? null
        : Hk.fromJson(json['HK'] as Map<String, dynamic>),
    hn: json['HN'] == null
        ? null
        : Hn.fromJson(json['HN'] as Map<String, dynamic>),
    hr: json['HR'] == null
        ? null
        : Hr.fromJson(json['HR'] as Map<String, dynamic>),
    hu: json['HU'] == null
        ? null
        : Hu.fromJson(json['HU'] as Map<String, dynamic>),
    id: json['ID'] == null
        ? null
        : Id.fromJson(json['ID'] as Map<String, dynamic>),
    ie: json['IE'] == null
        ? null
        : Ie.fromJson(json['IE'] as Map<String, dynamic>),
    il: json['IL'] == null
        ? null
        : Il.fromJson(json['IL'] as Map<String, dynamic>),
    resultsIn: json['IN'] == null
        ? null
        : In.fromJson(json['IN'] as Map<String, dynamic>),
    it: json['IT'] == null
        ? null
        : It.fromJson(json['IT'] as Map<String, dynamic>),
    jp: json['JP'] == null
        ? null
        : Jp.fromJson(json['JP'] as Map<String, dynamic>),
    kr: json['KR'] == null
        ? null
        : Kr.fromJson(json['KR'] as Map<String, dynamic>),
    lt: json['LT'] == null
        ? null
        : Lt.fromJson(json['LT'] as Map<String, dynamic>),
    lu: json['LU'] == null
        ? null
        : Lu.fromJson(json['LU'] as Map<String, dynamic>),
    lv: json['LV'] == null
        ? null
        : Lv.fromJson(json['LV'] as Map<String, dynamic>),
    mc: json['MC'] == null
        ? null
        : Mc.fromJson(json['MC'] as Map<String, dynamic>),
    md: json['MD'] == null
        ? null
        : Md.fromJson(json['MD'] as Map<String, dynamic>),
    me: json['ME'] == null
        ? null
        : Me.fromJson(json['ME'] as Map<String, dynamic>),
    mg: json['MG'] == null
        ? null
        : Mg.fromJson(json['MG'] as Map<String, dynamic>),
    mk: json['MK'] == null
        ? null
        : Mk.fromJson(json['MK'] as Map<String, dynamic>),
    ml: json['ML'] == null
        ? null
        : Ml.fromJson(json['ML'] as Map<String, dynamic>),
    mt: json['MT'] == null
        ? null
        : Mt.fromJson(json['MT'] as Map<String, dynamic>),
    mu: json['MU'] == null
        ? null
        : Mu.fromJson(json['MU'] as Map<String, dynamic>),
    mw: json['MW'] == null
        ? null
        : Mw.fromJson(json['MW'] as Map<String, dynamic>),
    mx: json['MX'] == null
        ? null
        : Mx.fromJson(json['MX'] as Map<String, dynamic>),
    my: json['MY'] == null
        ? null
        : My.fromJson(json['MY'] as Map<String, dynamic>),
    mz: json['MZ'] == null
        ? null
        : Mz.fromJson(json['MZ'] as Map<String, dynamic>),
    ni: json['NI'] == null
        ? null
        : Ni.fromJson(json['NI'] as Map<String, dynamic>),
    nl: json['NL'] == null
        ? null
        : Nl.fromJson(json['NL'] as Map<String, dynamic>),
    no: json['NO'] == null
        ? null
        : No.fromJson(json['NO'] as Map<String, dynamic>),
    nz: json['NZ'] == null
        ? null
        : Nz.fromJson(json['NZ'] as Map<String, dynamic>),
    pe: json['PE'] == null
        ? null
        : Pe.fromJson(json['PE'] as Map<String, dynamic>),
    ph: json['PH'] == null
        ? null
        : Ph.fromJson(json['PH'] as Map<String, dynamic>),
    pl: json['PL'] == null
        ? null
        : Pl.fromJson(json['PL'] as Map<String, dynamic>),
    pt: json['PT'] == null
        ? null
        : Pt.fromJson(json['PT'] as Map<String, dynamic>),
    py: json['PY'] == null
        ? null
        : Py.fromJson(json['PY'] as Map<String, dynamic>),
    ro: json['RO'] == null
        ? null
        : Ro.fromJson(json['RO'] as Map<String, dynamic>),
    rs: json['RS'] == null
        ? null
        : Rs.fromJson(json['RS'] as Map<String, dynamic>),
    ru: json['RU'] == null
        ? null
        : Ru.fromJson(json['RU'] as Map<String, dynamic>),
    se: json['SE'] == null
        ? null
        : Se.fromJson(json['SE'] as Map<String, dynamic>),
    sg: json['SG'] == null
        ? null
        : Sg.fromJson(json['SG'] as Map<String, dynamic>),
    si: json['SI'] == null
        ? null
        : Si.fromJson(json['SI'] as Map<String, dynamic>),
    sk: json['SK'] == null
        ? null
        : Sk.fromJson(json['SK'] as Map<String, dynamic>),
    td: json['TD'] == null
        ? null
        : Td.fromJson(json['TD'] as Map<String, dynamic>),
    th: json['TH'] == null
        ? null
        : Th.fromJson(json['TH'] as Map<String, dynamic>),
    tr: json['TR'] == null
        ? null
        : Tr.fromJson(json['TR'] as Map<String, dynamic>),
    tw: json['TW'] == null
        ? null
        : Tw.fromJson(json['TW'] as Map<String, dynamic>),
    tz: json['TZ'] == null
        ? null
        : Tz.fromJson(json['TZ'] as Map<String, dynamic>),
    ua: json['UA'] == null
        ? null
        : Ua.fromJson(json['UA'] as Map<String, dynamic>),
    ug: json['UG'] == null
        ? null
        : Ug.fromJson(json['UG'] as Map<String, dynamic>),
    us: json['US'] == null
        ? null
        : Us.fromJson(json['US'] as Map<String, dynamic>),
    ve: json['VE'] == null
        ? null
        : Ve.fromJson(json['VE'] as Map<String, dynamic>),
    za: json['ZA'] == null
        ? null
        : Za.fromJson(json['ZA'] as Map<String, dynamic>),
    zw: json['ZW'] == null
        ? null
        : Zw.fromJson(json['ZW'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'AO': ao?.toJson(),
    'AR': ar?.toJson(),
    'AT': at?.toJson(),
    'AU': au?.toJson(),
    'BA': ba?.toJson(),
    'BE': be?.toJson(),
    'BF': bf?.toJson(),
    'BG': bg?.toJson(),
    'BO': bo?.toJson(),
    'BR': br?.toJson(),
    'BY': by?.toJson(),
    'BZ': bz?.toJson(),
    'CA': ca?.toJson(),
    'CD': cd?.toJson(),
    'CH': ch?.toJson(),
    'CL': cl?.toJson(),
    'CM': cm?.toJson(),
    'CO': co?.toJson(),
    'CR': cr?.toJson(),
    'CV': cv?.toJson(),
    'CY': cy?.toJson(),
    'CZ': cz?.toJson(),
    'DE': de?.toJson(),
    'DK': dk?.toJson(),
    'EC': ec?.toJson(),
    'EE': ee?.toJson(),
    'EG': eg?.toJson(),
    'ES': es?.toJson(),
    'FI': fi?.toJson(),
    'FR': fr?.toJson(),
    'GB': gb?.toJson(),
    'GG': gg?.toJson(),
    'GH': gh?.toJson(),
    'GI': gi?.toJson(),
    'GR': gr?.toJson(),
    'GT': gt?.toJson(),
    'HK': hk?.toJson(),
    'HN': hn?.toJson(),
    'HR': hr?.toJson(),
    'HU': hu?.toJson(),
    'ID': id?.toJson(),
    'IE': ie?.toJson(),
    'IL': il?.toJson(),
    'IN': resultsIn?.toJson(),
    'IT': it?.toJson(),
    'JP': jp?.toJson(),
    'KR': kr?.toJson(),
    'LT': lt?.toJson(),
    'LU': lu?.toJson(),
    'LV': lv?.toJson(),
    'MC': mc?.toJson(),
    'MD': md?.toJson(),
    'ME': me?.toJson(),
    'MG': mg?.toJson(),
    'MK': mk?.toJson(),
    'ML': ml?.toJson(),
    'MT': mt?.toJson(),
    'MU': mu?.toJson(),
    'MW': mw?.toJson(),
    'MX': mx?.toJson(),
    'MY': my?.toJson(),
    'MZ': mz?.toJson(),
    'NI': ni?.toJson(),
    'NL': nl?.toJson(),
    'NO': no?.toJson(),
    'NZ': nz?.toJson(),
    'PE': pe?.toJson(),
    'PH': ph?.toJson(),
    'PL': pl?.toJson(),
    'PT': pt?.toJson(),
    'PY': py?.toJson(),
    'RO': ro?.toJson(),
    'RS': rs?.toJson(),
    'RU': ru?.toJson(),
    'SE': se?.toJson(),
    'SG': sg?.toJson(),
    'SI': si?.toJson(),
    'SK': sk?.toJson(),
    'TD': td?.toJson(),
    'TH': th?.toJson(),
    'TR': tr?.toJson(),
    'TW': tw?.toJson(),
    'TZ': tz?.toJson(),
    'UA': ua?.toJson(),
    'UG': ug?.toJson(),
    'US': us?.toJson(),
    'VE': ve?.toJson(),
    'ZA': za?.toJson(),
    'ZW': zw?.toJson(),
  };

  @override
  List<Object?> get props {
    return [
      ao,
      ar,
      at,
      au,
      ba,
      be,
      bf,
      bg,
      bo,
      br,
      by,
      bz,
      ca,
      cd,
      ch,
      cl,
      cm,
      co,
      cr,
      cv,
      cy,
      cz,
      de,
      dk,
      ec,
      ee,
      eg,
      es,
      fi,
      fr,
      gb,
      gg,
      gh,
      gi,
      gr,
      gt,
      hk,
      hn,
      hr,
      hu,
      id,
      ie,
      il,
      resultsIn,
      it,
      jp,
      kr,
      lt,
      lu,
      lv,
      mc,
      md,
      me,
      mg,
      mk,
      ml,
      mt,
      mu,
      mw,
      mx,
      my,
      mz,
      ni,
      nl,
      no,
      nz,
      pe,
      ph,
      pl,
      pt,
      py,
      ro,
      rs,
      ru,
      se,
      sg,
      si,
      sk,
      td,
      th,
      tr,
      tw,
      tz,
      ua,
      ug,
      us,
      ve,
      za,
      zw,
    ];
  }
}
