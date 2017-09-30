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

;%QMEXNOG^INT^1^59547,73878^0
%QMEXNOG ;;04:59 PM  21 Oct 1992; ; 21 Oct 92  5:34 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
AJ() N NOE,DX,DY,R,MSG,COMP
DMD S DX=0,DY=22 D CLEBAS^%VVIDEO
 S NOE=$$^%VZAME1($$^%QZCHW("Nom du noeud a creer : ")) Q:NOE="" 0
 S COMP=ATN_","_NOE
 I $$IR^%QSGEST5("ETAT.RESEAU",COMP) D M("Ce noeud existe deja...") G DMD
 S R=$$CREER^%QSGEIND("ETAT.RESEAU",COMP,NOE,1,.MSG)
 D ^%QSATTRI(COMP,"ETAT.RESEAU",0,0,80,23)
 Q 1
 
 
 
MOD(NOE) 
 D ^%QSATTRI(ATN_","_NOE,"ETAT.RESEAU",0,0,80,23)
 Q
 
 
 
SUP(NO) 
 N BASE,VAL,ORD,ADR,OO,NOE
 S BASE="ETAT.RESEAU",NOE=ATN_","_NO
 I $$AIR^%QSGEST5(BASE,NOE,"COMMENTAIRE.PROLOGUE") S VAL=$$^%QSCALVA(BASE,NOE,"COMMENTAIRE.PROLOGUE"),ORD=$$OR^%QSCALVA(BASE,NOE,"COMMENTAIRE.PROLOGUE",VAL) D SUPP^%QSNOTE3(BASE,NOE,ORD)
 I $$AIR^%QSGEST5(BASE,NOE,"COMMENTAIRE.EPILOGUE") S VAL=$$^%QSCALVA(BASE,NOE,"COMMENTAIRE.EPILOGUE"),ORD=$$OR^%QSCALVA(BASE,NOE,"COMMENTAIRE.EPILOGUE",VAL) D SUPP^%QSNOTE3(BASE,NOE,ORD)
 S VAL="",OO="",ADR=$$ADRESSE^%QMEBCDT
SUTRAN S OO=$$NXTRIAO^%QSTRUC8(BASE,NOE,"LIEN.SUIVI.DE",OO) G:OO="" SURTRAN
 S VAL=$$VALEUR^%QSTRUC8(BASE,NOE,"LIEN.SUIVI.DE",OO)
 S ORD=""
BSUTRAN S ORD=$O(@ADR@(VAL,"CONDITION.TRANSITION",ORD)) G:ORD="" SUTRAN
 D KILL^%ANA(@ADR@(VAL,"CONDITION.TRANSITION",ORD))
 K @ADR@(VAL,"CONDITION.TRANSITION",ORD)
 G BSUTRAN
 
SURTRAN S OO=$$NXTRIAO^%QSTRUC8(BASE,NOE,"INVERSE.SUIVI.DE",OO) G:OO="" SUTOUT
 S VAL=$$VALEUR^%QSTRUC8(BASE,NOE,"INVERSE.SUIVI.DE",OO)
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
 I $$IR^%QSGEST5("ETAT.RESEAU",ATN_","_NEWN) D M("Ce noeud existe deja...") G DMDD
 S VISU=1
 G CORPSD
CORPSDUP() 
CORPSD D ^%VZEATT
 N REPL,BASE,LIST,DEST,AT,V,VAL,IND,NINDL,ON,ON2,ORD,ATT,NT,ACT,OO,NOEC,NEWC,RC,MSG
 S REPL=$$LIENI^%QSGEL3,BASE="ETAT.RESEAU",NOEC=ATN_","_NOE,NEWC=ATN_","_NEWN
 S RC=$$CREER^%QSGEIND(BASE,NEWC,NEWN,1,.MSG)
 S AT=""
BAT S AT=$$NXTRIA^%QSTRUC8(BASE,NOEC,AT) G:AT="" BATF
 G:AT="NOM" BAT
 G:$P(AT,".")="COMMENTAIRE" BAT
 G:$$TYPE^%QSGEST9(BASE,AT)'=0 BAT
 S ORD=""
BORD S ORD=$$NXTRIAO^%QSTRUC8(BASE,NOEC,AT,ORD) G:ORD="" BAT
 S V=$$VALEUR^%QSTRUC8(BASE,NOEC,AT,ORD)
 D PA^%QSGESTI(BASE,NEWC,AT,V,ORD)
 G BORD
 
BATF S LIST("DESTINATION.SUIVI.DE")="",LIST("NOM")="",LIST("NOM.LIEN")=""
 S LIST("NUMERO.ORDRE")="",LIST("REP.DESTINATION")=""
 S LIST("REP.SOURCE")="",LIST("SOURCE.SUIVI.DE")=""
 S OO=""
BTRANS S OO=$$NXTRIAO^%QSTRUC8(BASE,NOEC,"LIEN.SUIVI.DE",OO)
 G:OO="" BRTRANS
 S V=$$VALEUR^%QSTRUC8(BASE,NOEC,"LIEN.SUIVI.DE",OO)
 S DEST=$$^%QSCALVA(REPL,V,"DESTINATION.SUIVI.DE")
 D ADDS^%QSGEST3(BASE,NEWC,"ETAT.PRECEDE",BASE,DEST)
 S NINDL=$$DERNL^%QSGES21(BASE,NEWC,"ETAT.PRECEDE")
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
 
BRTRANS S OO=$$NXTRIAO^%QSTRUC8(BASE,NOEC,"INVERSE.SUIVI.DE",OO) G:OO="" NOTE
 S V=$$VALEUR^%QSTRUC8(BASE,NOEC,"INVERSE.SUIVI.DE",OO)
 S DEST=$$^%QSCALVA(REPL,V,"SOURCE.SUIVI.DE")
 D ADDS^%QSGEST3(BASE,DEST,"ETAT.PRECEDE",BASE,NEWC)
 S NINDL=$$DERNL^%QSGES21(BASE,NEWC,"ETAT.PRECEDE")
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
NOTE S IND=NOEC
 S ATT="COMMENTAIRE.PROLOGUE"
 G:'($$AIR^%QSGEST5(BASE,NOEC,ATT)) NOTE2
 S VAL=$$^%QSCALVA(BASE,NOEC,ATT)
 S ON2=$$OR^%QSCALVA(BASE,NOEC,ATT,VAL)
 S NT=VAL,ACT="A"
 D SAISD^%QSNOTE(.ON)
 D DUPL^%QSNOTE(BASE,IND,ON2,QUI,NEWC,ON)
 D PA^%QSGESTI(BASE,NEWC,ATT,VAL,ON)
NOTE2 S ATT="COMMENTAIRE.EPILOGUE"
 G:'($$AIR^%QSGEST5(BASE,NOEC,ATT)) MODIF
 S VAL=$$^%QSCALVA(BASE,NOEC,ATT)
 S ON2=$$OR^%QSCALVA(BASE,NOEC,ATT,VAL)
 S NT=VAL,ACT="A"
 D SAISD^%QSNOTE(.ON)
 D DUPL^%QSNOTE(BASE,IND,ON2,QUI,NEWC,ON)
 D PA^%QSGESTI(BASE,NEWC,ATT,VAL,ON)
MODIF D:VISU ^%QSATTRI(NEWC,BASE,0,0,80,23)
 Q 1
 
 
 
 
CHGN(NOE) 
 N NEWN,DX,DY,VISU
DMDG S DX=0,DY=22 X XY D CLEBAS^%VVIDEO
 S NEWN=$$^%VZAME1($$^%QZCHW("Nouveau nom du noeud : ")) Q:NEWN="" 0
 I $$IR^%QSGEST5("ETAT.RESEAU",ATN_","_NEWN) D M("Un noeud portant ce nom existe deja...") G DMDG
 S VISU=0,BID=$$CORPSDUP
 D SUP(NOE)
 Q 1
 
M(M) D ^%VZEAVT($$^%QZCHW(M)) Q

