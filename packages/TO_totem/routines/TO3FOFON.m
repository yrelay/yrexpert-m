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

;TO3FOFON^INT^1^59547,74870^0
TO3FOFON ;
 
 K ^[QUI]RANG(ARTI),^[QUI]DEPARG(ARTI),^[QUI]BLOCIMPL(ARTI),^[QUI]BLOCOPER(ARTI),^[QUI]BLOCPHAS(ARTI),^[QUI]VEXTRANS(ARTI),^[QUI]FIMPLICI(ARTI),^[QUI]FNOMENC(ARTI),^[QUI]FFORMULE(ARTI),^[QUI]FSELMAT(ARTI),^[QUI]FDIMOUT(ARTI),^[QUI]FTOCTREV(ARTI)
 K ^[QUI]FAUTREFO(ARTI)
 S YA=ARTI
 S NUARG=1,TABFICT="^[QUI]FLIMPLI",TABIMP="^[QUI]FLIMPLI",ADR="PREPA^TO3FOFOT",^[QUI]BLOCIMPL(ARTI,"%GR")=1
RECABR S ETUD="IMPL",%RSMIN=18,NOMTAB="^[QUI]FLIMPLI(ARTI)",FONTAB="^[QUI]FIMPLICI(ARTI",F1=18,NFOR=1,NCLE=3,PNUM=2
 S B2=-1 F UUV=0:0 S B2=$N(^[QUI]FLIMPLI(ARTI,B2)) Q:B2=-1  S B3=-1 F VVU=0:0 S B3=$N(^[QUI]FLIMPLI(ARTI,B2,B3)) Q:B3=-1  D TT1^TO3FOFOS
 K UUV,VVU,WWU S ETUD="NOME",%RSMIN=18,NOMTAB="^[QUI]FLNOM(ARTI)",FONTAB="^[QUI]FNOMENC(ARTI",F1=18,NFOR=1,NCLE=3,PNUM=2
 S B2=-1 F UUV=0:0 S B2=$N(^[QUI]FLNOM(ARTI,B2)) Q:B2=-1  S B3=-1 F VVU=0:0 S B3=$N(^[QUI]FLNOM(ARTI,B2,B3)) Q:B3=-1  D TTT1^TO3FOFOS
 K UUV,VVU,WWU S ETUD="FORM",%RSMIN=20,NOMTAB="^[QUI]FLFORM(ARTI)",FONTAB="^[QUI]FFORMULE(ARTI",F1=17,F2=19,NFOR=2,NCLE=5,B2=-1,PNUM=1
 F UUV=0:0 S B2=$N(^[QUI]FLFORM(ARTI,B2)) Q:B2=-1  S B3=-1 F VVU=0:0 S B3=$N(^[QUI]FLFORM(ARTI,B2,B3)) Q:B3=-1  S B4=-1 F XXU=0:0 S B4=$N(^[QUI]FLFORM(ARTI,B2,B3,B4)) Q:B4=-1  S B5=-1 F YYU=0:0 S B5=$N(^[QUI]FLFORM(ARTI,B2,B3,B4,B5)) Q:B5=-1  D TT2^TO3FOFOS
 K XXU,YYU,UUV,VVU,WWU S ETUD="AUTREFO",%RSMIN=2,NOMTAB="^[QUI]FLAUTRFO(ARTI)",FONTAB="^[QUI]FAUTREFO(ARTI",F1=2,NFOR=1,NCLE=6,B2=-1,PNUM=4,W="^[QUI]FLAUTRFO(ARTI)"
 F x=0:0 S B2=$N(@W@(B2)) Q:B2=-1  S B3=-1 F x=0:0 S B3=$N(@W@(B2,B3)) Q:B3=-1  S B4=-1 F x=0:0 S B4=$N(@W@(B2,B3,B4)) Q:B4=-1  S B5=-1 F x=0:0 S B5=$N(@W@(B2,B3,B4,B5)) Q:B5=-1  S B6=-1 F x=0:0 S B6=$N(@W@(B2,B3,B4,B5,B6)) Q:B6=-1  S ^AUTREFO($J,B6)=1 D TT5^TO3FOFOS
 D ^TOGRBLIM K x,UUV,VVU,WWU S ETUD="CONS",%RSMIN=17,NOMTAB="^[QUI]FLCONS(ARTI)",FONTAB="^[QUI]FOUTCONS(ARTI",F1=17,NFOR=1,NCLE=5,B2=-1,PNUM=1
 F UUV=0:0 S B2=$N(^[QUI]FLCONS(ARTI,B2)) Q:B2=-1  S B3=-1 F VVU=0:0 S B3=$N(^[QUI]FLCONS(ARTI,B2,B3)) Q:B3=-1  S B4=-1 F XXU=0:0 S B4=$N(^[QUI]FLCONS(ARTI,B2,B3,B4)) Q:B4=-1  S B5=-1 F YYU=0:0 S B5=$N(^[QUI]FLCONS(ARTI,B2,B3,B4,B5)) Q:B5=-1  D TT2^TO3FOFOS
 K UUV,VVU,WWU,XXU S ETUD="DIM",%RSMIN=17,NOMTAB="^[QUI]FLDIM(ARTI)",FONTAB="^[QUI]FDIMOUT(ARTI",F1=17,NFOR=1,NCLE=6,B2=-1,%T="^[QUI]FLDIM(ARTI)",PNUM=1
 F UUV=0:0 S B2=$N(@%T@(B2)) Q:B2=-1  S B3=-1 F VVU=0:0 S B3=$N(@%T@(B2,B3)) Q:B3=-1  S B4=-1 F WWU=1:1 S B4=$N(@%T@(B2,B3,B4)) Q:B4=-1  S B5=-1 F XXU=0:0 S B5=$N(@%T@(B2,B3,B4,B5)) Q:B5=-1  S B6=-1 F YYU=0:0 S B6=$N(@%T@(B2,B3,B4,B5,B6)) Q:B6=-1  D TT5^TO3FOFOS
 K UUV,VVU,WWU,XXU,YYU S ETUD="SELMAT",%RSMIN=17,NOMTAB="^[QUI]FLSELM(ARTI)",FONTAB="^[QUI]FSELMAT(ARTI",NFOR=1,F1=17,NCLE=4,PNUM=1
 S B2=-1 F UUV=0:0 S B2=$N(^[QUI]FLSELM(ARTI,B2)) Q:B2=-1  S B3=-1 F VVU=0:0 S B3=$N(^[QUI]FLSELM(ARTI,B2,B3)) Q:B3=-1  S B4=-1 F XXU=0:0 S B4=$N(^[QUI]FLSELM(ARTI,B2,B3,B4)) Q:B4=-1  D TT3^TO3FOFOS
 K UUV,VVU,WWU,XXU,YYU S ETUD="PHAS",%RSMIN=25,NOMTAB="^[QUI]FLPHAS(ARTI)",FONTAB="^[QUI]FPHASE(ARTI",NFOR=1,F1=25,NCLE=4,PNUM=1
 K UUV,VVU,WWU,XXU,YYU S B2=-1 F UUV=0:0 S B2=$N(^[QUI]FLPHAS(ARTI,B2)) Q:B2=-1  S B3=-1 F VVU=0:0 S B3=$N(^[QUI]FLPHAS(ARTI,B2,B3)) Q:B3=-1  S B4=-1 F XXU=0:0 S B4=$N(^[QUI]FLPHAS(ARTI,B2,B3,B4)) Q:B4=-1  D TTT3^TO3FOFOS
 K UUV,VVU S ETUD="MAT",%RSMIN=22,NOMTAB="^[QUI]FLMAT(ARTI)",FONTAB="^[QUI]FMATIERE(ARTI",F1=17,F2=18,F3=19,F4=20,F5=21,F6=22,NFOR=6,NCLE=2,PNUM=1
 S B2=-1 F UUV=0:0 S B2=$N(^[QUI]FLMAT(ARTI,B2)) Q:B2=-1  D TT4^TO3FOFOS
 K UUV,VVU S ETUD="CTREV",%RSMIN=21,NOMTAB="^[QUI]FLCTREV(ARTI)",FONTAB="^[QUI]FTOCTREV(ARTI",F1=18,F2=19,F3=20,NFOR=3,NCLE=2,PNUM=2
 S B2=-1 F UUV=0:0 S B2=$N(^[QUI]FLCTREV(ARTI,B2)) Q:B2=-1  D TT4^TO3FOFOS
FIN K %CAR,EXP5,%NBCAR,%RS,%RSMIN,B2,B3,B4,B5,B6,EXPARG,FOR,FTAB,NOMTAB,NUARG,POSF,PVIR,RF,RS,TABFICT,WRE,WT Q
END Q

