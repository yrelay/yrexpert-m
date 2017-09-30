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

;%MZ^INT^1^59547,73871^0
MOZ ;
 D KILL S DX=0,DY=23 X XY D MSG^%VZEATT("Initialisation ....")
 I RESUL(20)'="" D REP
 S HOST=$$TABID^%INCOIN("ORDINATEUR")
 I (HOST'="PDP")&(HOST'="IBM-PC") G VAX
 D EDIMOZ Q
 
 
 
 D LOGMOZ,END Q
LOGMOZ S PGM=RESUL(1)
 K ^MOZSAV($J) S ^MOZSAV($J,"QUI")=QUI,^MOZSAV($J,"WHOIS")=WHOIS,^MOZSAV($J,"PGM")=PGM,^MOZSAV($J,"%AJM")=%AJM,^MOZSAV($J,"HOST")=HOST
 D ^%QCAMEMS K
 S QUI=^MOZSAV($J,"QUI"),WHOIS=^MOZSAV($J,"WHOIS"),PGM=^MOZSAV($J,"PGM"),%AJM=^MOZSAV($J,"%AJM"),HOST=^MOZSAV($J,"HOST")
 D CURRENT^%IS,VARSYS^%QCSAP X ^MOZ100 D CLEPAG^%VVIDEO K  Q
END D ^%QCAMEMR
FIN D KILL D:IBMPC&TADTM STAND^%MZPC Q
 
 
EDIMOZ N TAB125,I
 S PGM=RESUL(1)
 S TAB125=$$TEMP^%SGUTIL K @(TAB125)
 D MEMX^%QCAMEM
 F I="WHOIS","QUI","PGM","%AJM","HOST","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125)
 D CURRENT^%IS,VARSYS^%QCSAP
 X ^MOZ100
 K  D RMEMX^%QCAMEM
 D CLEPAG^%VVIDEO
 K @(TAB125)
 D KILL D:IBMPC&TADTM STAND^%MZPC Q
 
 
 
 
VAX S PGM=RESUL(1) N (PGM,QUI,WHOIS,%AJM,HOST) D CURRENT^%IS,VARSYS^%QCSAP X ^MOZ100 D CLEPAG^%VVIDEO,FIN
KILL 
 K ^U($J),^MOZSAV($J),^IND($J),^OP($J),^MOZMOUV($J),^MOZCOM($J),^MOZTABU($J),^MOZTABUU($J),^MOZSAVU($J),^MOZLIEN($J),^MOZLIEN2($J) Q
 
REP 
 N MAG,I S MAG=$$GETLBLAN^%VTLBLAN(RESUL(20))
 Q:'($D(^TABIDENT(WHOIS,"MOZART",MAG)))
 F %U="GE","OE" S I=^TABIDENT(WHOIS,"MOZART",MAG,%U),^MOZIDF($I,WHOIS,%U)=I,^MOZIDF($I,WHOIS,$S(%U="GE":"GI",1:"OI"))=$$NOMINT^%QSF(I)
 Q

