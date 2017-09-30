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

%QCSAP ;
 
PARAMS(PORTE,SORTIE) 
 N BS,FF,RM,SL,SUB,XY,%A,%E,B,HOST
 I PORTE=0 S PORTE=$I
 S HOST=$$TABID^%INCOIN("ORDINATEUR")
 
 I HOST="VAX",PORTE["." D FIC(PORTE,"SORTIE") Q
 
 S SORTIE("IOLOC")=""
 I ($D(^%IS(PORTE,0))#10)=1 S SORTIE("IOLOC")=^%IS(PORTE,0)
 I $D(^%IS(PORTE,1)) S B=^%IS(PORTE,1),%A=$P(B,"^",3),SORTIE("IOT")=$P(B,"^",2),SORTIE("IOPAR")=$P(B,"^",6)
 
 I '($D(^%IS(PORTE,1))) S B=$$VTRMCK(PORTE),%A=$P(B,"^",3)
 
 I %A]"",$D(^%IS(0,"SUB",%A)),^%IS(0,"SUB",%A)]"" S SUB=%A,%A=^%IS(0,"SUB",%A),FF=$P(%A,"^",2),RM=+(%A),SL=$P(%A,"^",3),BS=$P(%A,"^",4),XY=$P(%A,"^",5)
 
 E  S FF="#",SL=24,BS="*8",RM=80,SUB="",XY=""
 S SORTIE("BS")=BS,SORTIE("FF")=FF,SORTIE("RM")=RM,SORTIE("SL")=SL,SORTIE("SUB")=SUB,SORTIE("XY")=XY
 S SORTIE("IO")=PORTE
 I B="" D CURRENT^%IS,VARSYS,^%VZEAVT($$^%QZCHW("Impossible d'identifier le terminal ")_PORTE) S SORTIE=0 Q
 S SORTIE=1 Q
 
FIC(FIC,SORT) 
 S @SORT@("IOPAR")="""RW"""
 S @SORT@("IOT")="RMS"
 S @SORT@("IO")=FIC
 S @SORT@("SUB")="RMS"
 S @SORT@("FF")="#"
 S @SORT@("SL")=66
 S @SORT@("BS")="*8"
 S @SORT@("RM")=132
 Q
VTRMCK(PORTE) 
 N %X,%E
 S %X="",%E=""
 I (PORTE?1"VT".E)!(PORTE?1"vt".E),$D(^%IS("VT0:")) S %X="VT0:"
 E  I (PORTE?1"RTA".E)!(PORTE?1"rta".E),$D(^%IS("RT0:")) S %X="RT0:"
 E  I (PORTE?1"LTA".E)!(PORTE?1"lta".E),$D(^%IS("LT0:")) S %X="LT0:"
 E  S:$D(^%IS("TERM")) %X="TERM"
 S:%X]"" %E=^%IS(%X,1) Q %E
TYPE(PORTE) 
 Q:'($D(^%IS(PORTE,1))) ""
 N CH
 S CH=^%IS(PORTE,1),CH=$P(CH,"^",3)
 Q CH
 
JOB(WHOIS) 
 N SORTIE,I
 S QUI=$$TABID^%INCOIN("MACHINE")
 I QUI="" Q 1
 D PARAMS($I,.SORTIE)
 F I="BS","FF","RM","SL","SUB","XY" S @I=SORTIE(I)
 Q 0
VARSYS 
 S DTM=^INCONNE("INCA3","TYPECR")="C-DTM"
 S IBMPC=^INCONNE("INCA3","TYPHOST")="C-IBM PC"
 S TADTM=(IBMPC=0)!((IBMPC&(SUB'="C-DTM"))&(SUB'="C-EGA"))
 S MODTM=SUB="C-DTM"
 S CLTOUC=$S(MODTM:"TOUCHE",SUB="C-VT100":"TOUCHE.VT100",1:"TOUCHE.VT200")
 S CLESCP=$S(MODTM:"ESCAPE",SUB="C-VT100":"ESCAPE.VT100",1:"ESCAPE.VT200")
 Q
 ;

