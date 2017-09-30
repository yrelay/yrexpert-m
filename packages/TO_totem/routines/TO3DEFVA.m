;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TO3DEFVA^INT^1^59547,74870^0
TO3DEFVA ;
 
 K TDF S:'($D(%ERRETUD)) %ERRETUD=0 I %ERRETUD=1,'(%TBVAL["TVPAR") D ^TO3DEFMC G FIN
 K ^TABITEM($I),^PILARG($I) S NITEM=1,TDF("NARG")=1
DEB S PCH=ITEM D TO^%QZNBN1 G:ISNUM FIN S TDF("LAT")=0 S:ITEM["'" TDF("LAT")=1
DEFITEM I ITEM'["'" G NRL
 S TDF("EF")=$P(ITEM,"'",1),TDF("EP")=$P(ITEM,"'",2) I TDF("EP")="" S ITEM=TDF("EF") G DEFITEM
 D RECON G:TDF("ISNRL") NRL G:IMPCTE=1 FIN S YART=TDF("EP"),TDF("PCHB")=PCH,(TDF("EFB"),PCH)=TDF("EF")
 I '($D(^[QUI]PAR(YART))) S TDF("OASFA")=SFA,SFA=YART D ^TO3VSFAB S SFA=TDF("OASFA") K OASFA
 S PCH=TDF("PCHB") I '($D(^[QUI]FULL(TDF("EP"),TDF("EF")))) S ITEMF=TDF("EFB"),TDF("PPP")=TDF("EP") G XYZ
 G ITF
NRL I ITEM["$ARG" G ARG
 I ITEM["$" S ITEMF=""""_ITEM_"""",VAPA=$$^%QZCHW("Fonction externe") D VAPA G FIN
 I $D(^[QUI]AMBI(SFA,ITEM))!$D(^[QUI]UNKN(SFA,ITEM)) G ITF
 I '($D(^[QUI]FULL(SFA,ITEM))) S ITEMF=""""_ITEM_"""",VAPA=$$^%QZCHW("C'est une valeur litterale") D VAPA G FIN
ITF S ITEMF=$S(ITEM'["'":ITEM,1:$P(ITEM,"'",1))
 G:TDF("LAT")=1 SUITE S VAPA=$S($D(@%TBVAL@(ITEMF)):@%TBVAL@(ITEMF),1:" ??? ") D VAPA G FIN
SUITE S:'($D(%IMP)) %IMP=0 I %IMP=1 D ^TO3SAVTR
 S TDF("PPP")=TDF("EP"),NOMTREE="^[QUI]TREEWORK(NUFA,"_NSFA,ADR="RECH^TO3DEFVA",NIV=2 D ^%QCAGTU1
 I STOP=1 D:%IMP=1 ^TO3RESTR G NM1
 S TDF("PPP")=TDF("EP"),NOMTREE="^[QUI]TREEWORK(NUFA",ADR="RECH^TO3DEFVA",NIV=2 D ^%QCAGTU1 I %IMP=1 D ^TO3RESTR
 I STOP=1 G NM1
XYZ S:$D(^[QUI]PAREFLAT(NUFA,TDF("PPP"),ITEMF)) VAPA=^[QUI]PAREFLAT(NUFA,TDF("PPP"),ITEMF) S:'($D(^[QUI]PAREFLAT(NUFA,TDF("PPP"),ITEMF))) VAPA="???" S ITEMF=ITEMF_$$^%QZCHW(" de ")_TDF("PPP") D VAPA G FIN
NM1 S STOP=0 G:'($D(@%TBVAL@(ITEMF))) XYZ S VAPA=@%TBVAL@(ITEMF),ITEMF=ITEMF_$$^%QZCHW(" de ")_$P(TDF("NOD"),"^",2) D VAPA
FIN K TDF Q
RECON S TDF("ISNRL")=0,IMPCTE=0
 G:'($D(^[QUI]FULL(SFA,TDF("EP")))) RECS
 S TDF("EP")=@%TBVAL@(TDF("EP")),ITEMF=TDF("EF")_$$^%QZCHW(" de ")_TDF("EP"),VAPA=$S($D(^[QUI]CONSTANT(TDF("EP"),TDF("EF"))):^[QUI]CONSTANT(TDF("EP"),TDF("EF")),1:"???"),IMPCTE=1 D VAPA G END
RECS I $D(^[QUI]CONSTANT(TDF("EP"),TDF("EF"))) S ITEMF=TDF("EF")_$$^%QZCHW(" de ")_TDF("EP"),VAPA=^[QUI]CONSTANT(TDF("EP"),TDF("EF")),IMPCTE=1 D VAPA G END
 I TDF("EP")=$$^%QZCHW("MATIERE") D MAT G END
 I TDF("EP")=$$^%QZCHW("ARTICLE") D ART G END
END K %M Q
RECH S TDF("NOD")=@NOM Q:$P(TDF("NOD"),"^",2)'=TDF("EP")  D ^TO3GREF S ISNUM=0,NSFAF=TWREF,STOP=1 Q
MAT S YA=SFA Q:'($D(@%TBVAL@("FAMMAT")))  S FMS=@%TBVAL@("FAMMAT")
 S TDF("MSS")=@%TBVAL@(NUFA,NSFA,$$^%QZCHW("MATIERE")),TDF("SFMAT")=$P(@("^[QUI]TREEWORK(NUFA,"_NSFA_")"),"^",6),ITEMF=TDF("EF")_$$^%QZCHW(" de MATIERE(")_TDF("MSS")_")"
 S VAPA=$S($D(^[QUI]PARMAT(NUFA,NSFA,TDF("EF"))):^[QUI]PARMAT(NUFA,NSFA,TDF("EF")),1:" ??? "),IMPCTE=1 D VAPA Q
VAPA S ^TABITEM($I,NITEM)=ITEMF_"~"_VAPA,NITEM=NITEM+1 Q
ARG S ^PILARG($I,TDF("NARG"))=ITEM,TDF("NARG")=TDF("NARG")+1 Q
TARG K FDT S FDT("WW")=1
GRAT Q:'($D(^PILARG($I,FDT("WW"))))  S FDT("RITEM")=^PILARG($I,FDT("WW"))
 D ARGT S FDT("WW")=FDT("WW")+1 G GRAT
ARGT S ITEM=-1
METI S ITEM=$N(^[QUI]RELATION(YA,FDT("RITEM"),ITEM)) Q:ITEM=-1  D DEB
 G METI
ART I %TBVAL["TVPAR" S ITEM=TDF("EF"),TDF("ISNRL")=1 Q
 S ITEMF=TDF("EF")_$$^%QZCHW(" de ")_@%TBVAL@($$^%QZCHW("ARTICLE")),VAPA=$S($D(^[QUI]TVPAR(NUFA,NSFA,TDF("EF"))):^[QUI]TVPAR(NUFA,NSFA,TDF("EF")),1:" ???"),IMPCTE=1 D VAPA Q

