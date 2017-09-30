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

;%QWETUC^INT^1^59547,73886^0
QWETUC ;
 
 
 
 
 
POP 
 Q:%AJM="C"
 I %AJM="M" S ICC=3,TAB(ICC)=AFRESU(ICC) G AFET
 S TAB(ICC)=$$POP^%QWETUDE
AFET D ^%VAFFICH S PATOUCH(ICC)=1
 Q
 
VIDE 
 I RESUL(ICC)="" D ^%VZEAVT($$^%QZCHW("Champ obligatoire")) S REFUSE=1
 Q
 
REP 
 I $$OKR^%INCOIN("QS")=0 Q
 N TYP
 S TYP=$$REPM^%QSGEST9(RESUL(ICC))
 I TYP=0 D ^%VZEAVT($$^%QZCHW("Repertoire inconnu dans le schema de donnees")) S REFUSE=1
 I TYP=1 D ^%VZEAVT($$^%QZCHW("Repertoire non autorise")) S REFUSE=1
 Q
 
DOM 
 N DOM
 I RESUL(ICC)="" S DOM="GENERAL" G FDO
 I RESUL(ICC)="?" G CHD
 I RESUL(ICC)="GENERAL" Q
 S REFUSE='($$EXISTE^%QWDMU(RESUL(ICC)))
 I REFUSE=1 D ^%VZEAVT($$^%QZCHW("Ce domaine n'existe pas"))
 Q
CHD 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Choisissez un domaine"),0)
 S DOM=$$CHOIX^%QWDMU
 D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR I DOM="" S REFUSE=1 Q
FDO S TAB(ICC)=DOM D ^%VAFFICH
 Q
 
TYPE 
 N TYP,TABC
 S REFUSE=0
 S TYP=RESUL(ICC)
 I TYP="INDIVIDU" G FTYP
 I TYP="ENSEMBLE.INDIVIDUS" G FTYP
 I TYP="ENSEMBLE.ATTRIBUTS" G FTYP
 S TABC(1)="ENSEMBLE.ATTRIBUTS",TABC(2)="INDIVIDU",TABC(3)="ENSEMBLE.INDIVIDUS"
 D POCLEPA^%VVIDEO S TYP=$$^%VZECHO("TABC") D POCLEPA^%VVIDEO
 I ($E(TYP,1,4)="ENSE")!($E(TYP,1,4)="INDI") S TAB(ICC)=TYP D ^%VAFFICH G FTYP
 S REFUSE=1 Q
FTYP I TYP'="INDIVIDU" S (PATOUCH(6),PATOUCH(7))=1
 Q
 
 
 
 
ATR 
 N ATR,I,LIS,LM,MOT,NEW
 S LM=RESUL(ICC)
 I LM="*" Q
 S REFUSE=0,NEW=""
 F I=1:1 S MOT=$P(LM,",",I) Q:MOT=""  D EXI Q:REFUSE=1
 I REFUSE=0 S TAB(ICC)=$J("",75) D ^%VAFFICH S TAB(ICC)=$P(NEW,",",1,$L(NEW,",")-1) D ^%VAFFICH
 Q
EXI 
 S OLD=$$GETLBLAN^%VTLBLAN(MOT),RESUL(ICC)=$P(OLD,"(")
 I OLD="" S REFUSE=0 Q
 D EXIOP^%LXUC5 Q:REFUSE
 D CHBKPT^%LXUC5 Q:REFUSE
 D FULL^%LXUC4 Q:REFUSE
 S NEW=NEW_RESUL(ICC)_$S($P(OLD,"(",2)="":"",1:" ("_$P(OLD,"(",2))_","
 Q
 
 
 
 
SIT 
 D ATR^%QSUC1
 I REFUSE=1 Q
 N CONT,ATR,OR
 S CONT=^[QUI]RQSGLO("QW","ETUDE",RESUL(3))
 I $P(CONT,"^",2)'="INDIVIDU" Q
 
 S ATR=$P(RESUL(ICC)," (",1),OR=$P($P(RESUL(ICC)," (",2),")",1)
 I $$^%QSCALIN($P(CONT,"^",4),$P(CONT,"^",3),ATR,OR)'="" D ^%VZEAVT($$^%QZCHW("Cet attribut existe deja sur l'individu")) S REFUSE=1
 Q
 
VAL 
 I RESUL(ICC)="" S REFUSE=1
 Q
 
 
CHAR 
 I RESUL(5)'="ENSEMBLE.INDIVIDUS" D ^%VSQUEAK Q
 N ETU,WWLSTOCK,WWSTOCK
 S WWSTOCK=$$CONCAT^%QZCHAD("^[QUI]RQSGLO(""QW"",""ET"")",""""_RESUL(3)_""",""I""")
 S WWLSTOCK=$$CONCAT^%QZCHAD("^[QUI]RQSGLO(""QW"",""ET"")",""""_RESUL(3)_""",""L""")
 S ETU=RESUL(3)
 D ^%VSAVMUL(SCR)
 D ^%QWINISP(ETU)
 D ^%VRESMUL(SCR),CLEPAG^%VVIDEO
 Q
 
 
 
KILE() 
 K @(m("OLDF")),@(m("OLDN"))
 Q:MOD'="supprimer" 0
 
 
 D SUP^%QWETUD2(RESUL(3))
 F I=1:1:8 S RESUL(I)=""
 D ^%VAFIGRI,^%VAFISCR
 Q 0
 
KILA() 
 K @(m("OLDF")),@(m("OLDN"))
 K ^[QUI]RQSDON("QW","BUT",RESUL(3),RESUL(4))
 Q 1
 
KILC() 
 K @(m("OLDF")),@(m("OLDN"))
 K ^[QUI]RQSDON("QW","CONTR",RESUL(3),RESUL(4))
 Q 1

