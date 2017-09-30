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

;%HXISTOD^INT^1^59547,73869^0
HXISTOD ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
VISU(L,ATTOT,ATGROUP,NUM,PAS,ATECL,NUM2,PAS2,FT,FGR,FECL,T,R,ECL,PARGL,PARGLC,IMPR,TYP,ABC,OPTH,ABC2,OPTH2,TIT) 
 N CHECH,ECART,ECHEL,HFHA,HTEXT,LARG,HHIST,LHIST,LMARG,NOCOL,MDCOL,LMARD
 N LMENU,CARD,COLON,CUMUL,MENU,NBCOL,REPER,REPI,TEXT,TEXT2,I,ADR,CTR
 N INDCOCOU,REPR,REPT,REPE,SSCUMUL,TEMP,CS,PARGLS,PARGLCS
 D INIT
 I IMPR=1 S CHECH=0,TYP=$S(TYP="G":"graphique",1:"standard") D BOUCL^%HXIIMPD(OPTH,OPTH2,TYP,TIT) G FIN
 D POCLEPA^%VVIDEO
 S CHECH=$$MES^%VZEOUI($$^%QZCHW("Les deux histogrammes ont-ils la meme echelle"),"N")
 D CLEPAG^%VVIDEO,PTENTR^%HXITOD2(1,0,OPTH,TYP),PTENTR^%HXITOD2(2,0,OPTH2,TYP)
 D DIAL^%HXITOD2(PARGLS_",1)",1,PARGLCS_",1)",TYP,TEMP)
FIN K @(TEMP)
 Q
 
 
VAL(FTOT,REP,INDIVIDU,ATOT) 
 N VALTOT S @(FTOT) Q VALTOT
VREG(FREG,REP,INDIVIDU,AREG) 
 N VALREG S @(FREG) Q VALREG
VECL(FREG2,REP,INDIVIDU,AREG2) 
 N VALECL S @(FREG2) Q VALECL
VATR(REP,INDIVIDU,ATR,HIS) 
 I HIS=1 Q $$VREG(FGR,REP,INDIVIDU,ATR)
 I HIS=2 Q $$VECL^%HXISTOD(FECL,REP,INDIVIDU,ATR)
 Q
 
INIT 
 S PARGLS=$E(PARGL,1,$L(PARGL)-1),PARGLCS=$E(PARGLC,1,$L(PARGLC)-1)
 S CARD=$$^%QSCALVA("L0",L,"CARD")
 S REPER=$$^%QSCALVA("L0",L,"OBJET"),REPI=$$NOMINT^%QSF(REPER)
 S REPT=$$RP(ATTOT),REPR=$$RP(ATGROUP),REPE=$$RP(ATECL)
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S @TEMP@("LISTE")=L,@TEMP@("T")=T,@TEMP@("ECL")=ECL,@TEMP@("R")=R
 S @TEMP@("ABC")=ABC,@TEMP@("ABC2")=ABC2
 S @TEMP@("OPTH")=OPTH,@TEMP@("OPTH2")=OPTH2
 
 S MENU=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S COLON=$$CONCAS^%QZCHAD(TEMP,"COL")
 S TEXT=$$CONCAS^%QZCHAD(TEMP,"TEXT")
 S TEXT2=$$CONCAS^%QZCHAD(TEMP,"TEXT2")
 S INDCOCOU=1
 
 S LMENU=23,ECART=1,HHIST=12,MDCOL=80,HFHA=4,HTEXT=4
 S NOCOL(1)=1,LARG(1)=4,LMARG(1)=11,LMARD(1)=42
 S NOCOL(2)=1,LARG(2)=4,LMARG(2)=51,LMARD(2)=2
 F I=1,2 S LHIST(I)=(MDCOL-LMARD(I))-LMARG(I),NBCOL(I)=LHIST(I)\(LARG(I)+ECART) S:(NBCOL(I)*(LARG(I)+ECART))<LHIST(I) NBCOL(I)=NBCOL(I)+1
 Q
RP(R) N RP S RP=$P(R,"^",2) Q $S(RP="":REPI,1:$$NOMINT^%QSF(RP))

