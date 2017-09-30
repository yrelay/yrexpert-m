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

;%QMEANOG^INT^1^59547,73877^0
%QMEANOG ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
AJ() N NOE,DX,DY
DMD S DX=0,DY=22 D CLEBAS^%VVIDEO
 S NOE=$$^%VZAME1($$^%QZCHW("Nom du noeud a creer : ")) Q:NOE="" 0
 I $$IR^%QSGEST5("NOEUD.I",NOE) D M("Ce noeud existe deja...") G DMD
 D PA^%QSGESTI("NOEUD.I",NOE,"NOM",NOE,1)
 D ^%QSATTRI(NOE,"NOEUD.I",0,0,80,23)
 Q 1
 
 
 
MOD(NOE) 
 D ^%QSATTRI(NOE,"NOEUD.I",0,0,80,23)
 Q
 
 
 
SUP(NOE) 
 N BASE,VAL,ORD,ADR,OO
 S BASE="NOEUD.I"
 I $$AIR^%QSGEST5(BASE,NOE,"COMMENTAIRE.PROLOGUE") S VAL=$$^%QSCALVA(BASE,NOE,"COMMENTAIRE.PROLOGUE"),ORD=$$OR^%QSCALVA(BASE,NOE,"COMMENTAIRE.PROLOGUE",VAL) D SUPP^%QSNOTE3(BASE,NOE,ORD)
 I $$AIR^%QSGEST5(BASE,NOE,"COMMENTAIRE.EPILOGUE") S VAL=$$^%QSCALVA(BASE,NOE,"COMMENTAIRE.EPILOGUE"),ORD=$$OR^%QSCALVA(BASE,NOE,"COMMENTAIRE.EPILOGUE",VAL) D SUPP^%QSNOTE3(BASE,NOE,ORD)
 S VAL="",OO="",ADR=$$ADRESSE^%QMEBCDT
SUTRAN S OO=$$NXTRIAO^%QSTRUC8(BASE,NOE,"LIEN.TRANSITION",OO)
 G:OO="" SURTRAN
 S VAL=$$VALEUR^%QSTRUC8(BASE,NOE,"LIEN.TRANSITION",OO)
 S ORD=""
BSUTRAN S ORD=$O(@ADR@(VAL,"CONDITION.TRANSITION",ORD))
 G:ORD="" SUTRAN
 D KILL^%ANA(@ADR@(VAL,"CONDITION.TRANSITION",ORD))
 K @ADR@(VAL,"CONDITION.TRANSITION",ORD)
 G BSUTRAN
 
SURTRAN S OO=$$NXTRIAO^%QSTRUC8(BASE,NOE,"INVERSE.TRANSITION",OO)
 G:OO="" SUTOUT
 S VAL=$$VALEUR^%QSTRUC8(BASE,NOE,"INVERSE.TRANSITION",OO)
 S ORD=""
BSURTRAN S ORD=$O(@ADR@(VAL,"CONDITION.TRANSITION",ORD))
 G:ORD="" SURTRAN
 D KILL^%ANA(@ADR@(VAL,"CONDITION.TRANSITION",ORD))
 K @ADR@(VAL,"CONDITION.TRANSITION",ORD)
 G BSURTRAN
SUTOUT D SX^%QSGESTK(BASE,NOE)
 Q
 
 
 
 
DUP(NOE) 
 N NEWN,DX,DY,VISU
DMDD S DX=0,DY=22 D CLEBAS^%VVIDEO
 S NEWN=$$^%VZAME1($$^%QZCHW("Nom du nouveau noeud : ")) Q:NEWN="" 0
 I $$IR^%QSGEST5("NOEUD.I",NEWN) D M("Ce noeud existe deja...") G DMDD
 S VISU=1
 G CORPSD
CORPSDUP() 
CORPSD D ^%VZEATT
 N REPL,BASE,LIST,DEST,AT,V,VAL,IND,NINDL,ON,ON2,ORD,ATT,NT,ACT,OO
 S REPL=$$LIENI^%QSGEL3,BASE="NOEUD.I"
 D PA^%QSGESTI(BASE,NEWN,"NOM",NEWN,1)
 S AT=""
BAT S AT=$$NXTRIA^%QSTRUC8(BASE,NOE,AT) G:AT="" BATF
 G:AT="NOM" BAT
 G:$P(AT,".")="COMMENTAIRE" BAT
 G:$$TYPE^%QSGEST9(BASE,AT)'=0 BAT
 S ORD=""
BORD S ORD=$$NXTRIAO^%QSTRUC8(BASE,NOE,AT,ORD) G:ORD="" BAT
 S V=$$VALEUR^%QSTRUC8(BASE,NOE,AT,ORD)
 D PA^%QSGESTI(BASE,NEWN,AT,V,ORD)
 G BORD
 
BATF S LIST("DESTINATION.TRANSITION")="",LIST("NOM")="",LIST("NOM.LIEN")=""
 S LIST("NUMERO.ORDRE")="",LIST("REP.DESTINATION")=""
 S LIST("REP.SOURCE")="",LIST("SOURCE.TRANSITION")=""
 S OO=""
BTRANS S OO=$$NXTRIAO^%QSTRUC8(BASE,NOE,"LIEN.TRANSITION",OO)
 G:OO="" BRTRANS
 S V=$$VALEUR^%QSTRUC8(BASE,NOE,"LIEN.TRANSITION",OO)
 S DEST=$$^%QSCALVA(REPL,V,"DESTINATION.TRANSITION")
 D ADDS^%QSGEST3(BASE,NEWN,"TRANSITION",BASE,DEST)
 S NINDL=$$DERNL^%QSGES21(BASE,NEWN,"TRANSITION")
 G:NINDL="" BTRANS
 S AT=""
BATIL S AT=$$NXTRIA^%QSTRUC8(REPL,V,AT) G:AT="" BTRANS
 G:$D(LIST(AT)) BATIL
 S ORD=""
BORDIL S ORD=$$NXTRIAO^%QSTRUC8(REPL,V,AT,ORD) G:ORD="" BATIL
 S VAL=$$VALEUR^%QSTRUC8(REPL,V,AT,ORD)
 D PA^%QSGESTI(REPL,NINDL,AT,VAL,ORD)
 G:AT'="CONDITION.TRANSITION" BORDIL
 G:'($D(^[QUI]RQSGLO("QMEB",V,AT,ORD))) BORDIL
 S ^[QUI]RQSGLO("QMEB",NINDL,AT,ORD)=$$RECOP^%ANA(^[QUI]RQSGLO("QMEB",V,AT,ORD))
 G BORDIL
 
BRTRANS S OO=$$NXTRIAO^%QSTRUC8(BASE,NOE,"INVERSE.TRANSITION",OO) G:OO="" NOTE
 S V=$$VALEUR^%QSTRUC8(BASE,NOE,"INVERSE.TRANSITION",OO)
 S DEST=$$^%QSCALVA(REPL,V,"SOURCE.TRANSITION")
 D ADDS^%QSGEST3(BASE,DEST,"TRANSITION",BASE,NEWN)
 S NINDL=$$DERNL^%QSGES21(BASE,NEWN,"TRANSITION")
 G:NINDL="" BRTRANS
 S AT=""
BATIL2 S AT=$$NXTRIA^%QSTRUC8(REPL,V,AT) G:AT="" BRTRANS
 G:$D(LIST(AT)) BATIL2
 S ORD=""
BORDIL2 S ORD=$$NXTRIAO^%QSTRUC8(REPL,V,AT,ORD) G:ORD="" BATIL2
 S VAL=$$VALEUR^%QSTRUC8(REPL,V,AT,ORD)
 D PA^%QSGESTI(REPL,NINDL,AT,VAL,ORD)
 G:AT'="CONDITION.TRANSITION" BORDIL2
 G:'($D(^[QUI]RQSGLO("QMEB",V,AT,ORD))) BORDIL2
 S ^[QUI]RQSGLO("QMEB",NINDL,AT,ORD)=$$RECOP^%ANA(^[QUI]RQSGLO("QMEB",V,AT,ORD))
 G BORDIL2
NOTE S IND=NOE
 S ATT="COMMENTAIRE.PROLOGUE"
 G:'($$AIR^%QSGEST5(BASE,NOE,ATT)) NOTE2
 S VAL=$$^%QSCALVA(BASE,NOE,ATT)
 S ON2=$$OR^%QSCALVA(BASE,NOE,ATT,VAL)
 S NT=VAL,ACT="A"
 D SAISD^%QSNOTE(.ON)
 D DUPL^%QSNOTE(BASE,IND,ON2,QUI,NEWN,ON)
 D PA^%QSGESTI(BASE,NEWN,ATT,VAL,ON)
NOTE2 S ATT="COMMENTAIRE.EPILOGUE"
 G:'($$AIR^%QSGEST5(BASE,NOE,ATT)) MODIF
 S VAL=$$^%QSCALVA(BASE,NOE,ATT)
 S ON2=$$OR^%QSCALVA(BASE,NOE,ATT,VAL)
 S NT=VAL,ACT="A"
 D SAISD^%QSNOTE(.ON)
 D DUPL^%QSNOTE(BASE,IND,ON2,QUI,NEWN,ON)
 D PA^%QSGESTI(BASE,NEWN,ATT,VAL,ON)
MODIF D:VISU ^%QSATTRI(NEWN,BASE,0,0,80,23)
 Q 1
 
 
 
 
CHGN(NOE) 
 N NEWN,DX,DY,VISU
DMDG S DX=0,DY=22 X XY D CLEBAS^%VVIDEO
 S NEWN=$$^%VZAME1($$^%QZCHW("Nouveau nom du noeud : ")) Q:NEWN="" 0
 I $$IR^%QSGEST5("NOEUD.I",NEWN) D M("Un noeud portant ce nom existe deja...") G DMDG
 S VISU=0,BID=$$CORPSDUP
 D SUP(NOE)
 Q 1
 
M(M) D ^%VZEAVT($$^%QZCHW(M)) Q

