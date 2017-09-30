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

;%ATNMN^INT^1^59547,73866^0
%ATNMN ;;04:14 PM  27 Oct 1992; ; 26 Mar 93  4:23 PM
 
MENU 
 
 S %PROG=$T(+0) X ^TOLISRAM(1) Q
FUN ;;ATN
 ;;#Creation# d'ATN;;CREAT^%ATNGES
 ;;#Modification# d'ATN;;CM^%ATNGES
 ;;#Suppression# d'ATN;;SUPP^%ATNGES
 ;;#Activation# de l'evaluateur d'ATN;;^%ATNEXE
 ;;Consultation de #resultats#;;JRN^%ATNMN
 ;;#Compilation# d'atn;;^xwCOMPATN0
 ;;#Execution# d'un version compilee;;RUN^%ATNMN
FUNC ;;
 ;;saisie et modification d'atn
 ;;consultation ou modification d'atn
 ;;suppression d'atn
 ;;activation
 ;;consultation d'etude
 ;;compilation (par activation de la version compilee de l'atn COMPATN)
 ;;DO de la version compilee
 ;;
 ;;
 
RESUL 
 N TEMP,GET
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S ET="" F %ET=0:0 S ET=$O(^[QUI]RQSDON("RESATN","R",ET)) Q:ET=""  S VAL=ET_"  "_^[QUI]RQSDON("RESATN","R",ET,"C",2)_"  "_^[QUI]RQSDON("RESATN","R",ET,"C",1),@TEMP@(VAL)=""
 D INIT^%QUCHOIP(TEMP,0,1,0,0,78,18)
RESBCL D AFF^%QUCHOIP
 S VAL=$$UN^%QUCHOIP
 I VAL="" D END^%QUCHOIP Q
 S ET=$P(VAL," ")
 S GG="^[QUI]RQSDON(""RESATN"",""R"","""_ET_""")"
 D CLEPAG^%VVIDEO
 W !,!,!,"  E N T R E E S",!,!,!
 S IE="" F %IE=1:1 S IE=$O(@GG@("E",IE)) Q:IE=""  I $D(@GG@("E",IE))#10 W !,IE,"  =  ",@GG@("E",IE)
 D ^%VZEAVT("")
 D CLEPAG^%VVIDEO
 W !,!,!," H I S T O R I Q U E  D ' E X E C U T I O N",!,!,!
 S IE="" F %IE=1:1 S IE=$O(@GG@("D",IE)) Q:IE=""  W !,@GG@("D",IE) I '(IE#20) D ^%VZEAVT(""),CLEPAG^%VVIDEO
 D ^%VZEAVT(""),CLEPAG^%VVIDEO
 W !,!,!,"  S O R T I E S",!,!,!
 S IE="" F %IE=1:1 S IE=$O(@GG@("S",IE)) Q:IE=""  I $D(@GG@("S",IE))#10 W !,IE,"  =  ",@GG@("S",IE)
 D ^%VZEAVT("")
 D CLEPAG^%VVIDEO
 G RESBCL
 
RUN 
 D CLEPAG^%VVIDEO
 W !,"nom de l'atn" R ATN
 D @("^xw"_ATN_"0")
 Q
 
 
JRN 
 N MN,ADRES,CONTR
 N TEMP,GET,ET,%ET,VAL,LSEL
 S MN=$$TEMP^%SGUTIL,TEMP=$$TEMP^%SGUTIL,LSEL=$$TEMP^%SGUTIL
 D ON^%VZEATT
 S ET="" F %ET=0:0 S ET=$O(^[QUI]RQSDON("RESATN","R",ET)) Q:ET=""  S VAL=ET_"  "_^[QUI]RQSDON("RESATN","R",ET,"C",2)_"  "_^[QUI]RQSDON("RESATN","R",ET,"C",1),@TEMP@(VAL)=""
 D INIT^%QUCHOIP(TEMP,0,1,0,0,78,20)
 D OFF^%VZEATT
 S @MN="20^10^79"
 S @MN@(1)=$$^%QZCHW("Journal")_"^HIS"
 S @MN@(1,"COM")=$$^%QZCHW("Journal d'execution d'une etude")
 S @MN@(2)=$$^%QZCHW("Entrees")_"^ENT"
 S @MN@(2,"COM")=$$^%QZCHW("Parametres d'entree d'une etude")
 S @MN@(3)=$$^%QZCHW("Sorties")_"^SOR"
 S @MN@(3,"COM")=$$^%QZCHW("Parametres de sorties d'une etude")
 S @MN@(4)=$$^%QZCHW("Suppression")_"^SUP"
 S @MN@(4,"COM")=$$^%QZCHW("Suppression d'etudes")
 D AFF^%QUCHOIP
MEN 
 S DX=1,DY=20 X XY D CLEBAS^%VVIDEO
 D ^%VQUIKMN(0,80,21,MN,.ADRES,.CONTR) G:ADRES'="" @ADRES
 G:(CONTR="A")!(CONTR="F") FIN
 G MEN
FIN D END^%QUCHOIP
 K @(MN),@(TEMP),@(LSEL)
 Q
HIS 
 S VAL=$$UN^%QUCHOIP
 I VAL="" G MEN
 S ET=$P(VAL," ")
 S GG="^[QUI]RQSDON(""RESATN"",""R"","""_ET_""")"
 D CLEPAG^%VVIDEO
 W !,!,!," H I S T O R I Q U E  D ' E X E C U T I O N",!,!,!
 S IE="" F %IE=1:1 S IE=$O(@GG@("D",IE)) Q:IE=""  W !,@GG@("D",IE) I '(IE#20) D ^%VZEAVT(""),CLEPAG^%VVIDEO
 D ^%VZEAVT(""),CLEPAG^%VVIDEO,AFF^%QUCHOIP
 G MEN
ENT 
 S VAL=$$UN^%QUCHOIP
 I VAL="" G MEN
 S ET=$P(VAL," ")
 S GG="^[QUI]RQSDON(""RESATN"",""R"","""_ET_""")"
 D CLEPAG^%VVIDEO
 W !,!,!,"  E N T R E E S",!,!,!
 S IE="" F %IE=1:1 S IE=$O(@GG@("E",IE)) Q:IE=""  I $D(@GG@("E",IE))#10 W !,IE,"  =  ",@GG@("E",IE)
 D ^%VZEAVT(""),CLEPAG^%VVIDEO,AFF^%QUCHOIP
 G MEN
SOR 
 S VAL=$$UN^%QUCHOIP
 I VAL="" G MEN
 S ET=$P(VAL," ")
 S GG="^[QUI]RQSDON(""RESATN"",""R"","""_ET_""")"
 D CLEPAG^%VVIDEO
 W !,!,!,"  S O R T I E S",!,!,!
 S IE="" F %IE=1:1 S IE=$O(@GG@("S",IE)) Q:IE=""  I $D(@GG@("S",IE))#10 W !,IE,"  =  ",@GG@("S",IE)
 D ^%VZEAVT(""),CLEPAG^%VVIDEO,AFF^%QUCHOIP
 G MEN
 
SUP 
 K @(LSEL)
 D ^%QUCHOYP(LSEL)
 S DX=1,DY=20 X XY D CLEBAS^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez-vous la suppression de ces etudes"))'=1 G MEN
 S VAL="" F %V=0:0 S VAL=$O(@LSEL@(VAL)) Q:VAL=""  S ET=$P(VAL," ") D SUPETU(ET) K @TEMP@(VAL)
 D END^%QUCHOIP
 D CLEPAG^%VVIDEO
 D INIT^%QUCHOIP(TEMP,0,1,0,0,78,20)
 D AFF^%QUCHOIP
 G MEN
SUPETU(ETU) N ATN
 Q:ETU=""
 S ATN=$S($D(^[QUI]RQSDON("RESATN","R",ETU,"C",1)):^[QUI]RQSDON("RESATN","R",ETU,"C",1),1:"")
 K:ATN'="" ^[QUI]RQSDON("RESATN","N",ATN,ETU)
 K ^[QUI]RQSDON("RESATN","R",ETU)
 Q

