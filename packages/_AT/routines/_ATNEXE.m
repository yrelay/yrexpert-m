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

;%ATNEXE^INT^1^59547,73866^0
%ATNEXE ;;09:46 AM  8 Sep 1993; ; 08 Sep 93  9:58 AM
 
 N GSVGDE
 
 D CLEPAG^%VVIDEO
 S %VNGA=1
 W !,"NOM DE L'ATN A EVALUER " R %VNE(1,1)
 W !,"MODE VISIBLE (0/1) " R %VNE(1,3)
GO S %VNE(%VNGA,2)=$$GEN^%QCAPOP("ATN")
 S %VNE(%VNGA,7)=0
 K ^PARAENT($J)
 
 
 D INICAR
 I %VNI(%VNGA,12)'="",$D(^%RQSGLO("MOTEUR",%VNI(%VNGA,12),"SAISIE.ENTREES")) S @("tt="_^%RQSGLO("MOTEUR",%VNI(%VNGA,12),"SAISIE.ENTREES")_"(%VNGA)") G:tt=0 RETEXTER G GO2
 D ENTSTD^%ATNUTI(%VNGA,%VNE(1,1))
GO2 S GSVGDE=$$TEMP^%SGUTIL
 S (@GSVGDE@("%VNE"),@GSVGDE@("%VNGA"),@GSVGDE@("%VNI"),@GSVGDE@("%VNS"),@GSVGDE@("%VNG"))=""
 S %FIN=0
 G START
RETEXTER 
 I $D(^[QUI]RQSGLO("ATN",%VNE(1,1),"S"))#10 D @^[QUI]RQSGLO("ATN",%VNE(1,1),"S")
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
START S %MN=$$TEMP^%SGUTIL
 D MKMEN^%ATNEXE3
 
 K ^PARASOR($J,%VNGA),%VNI(%VNGA)
 
 
 D INITREM^%ATNREM(%VNE(%VNGA,1))
 
 S ^[QUI]RQSDON("RESATN","R",%VNE(%VNGA,2),"C",1)=%VNE(%VNGA,1)
 S ^[QUI]RQSDON("RESATN","R",%VNE(%VNGA,2),"C",2)=$$DATE^%QMDATE_" "_$$HEURE^%QMDATE
 D INICAR
 
 
 S %VNI(%VNGA,4)=1
 S ^[QUI]RQSDON("RESATN","R",%VNE(%VNGA,2),"D",%VNI(%VNGA,4))=$$DATE^%QMDATE_" "_$$HEURE^%QMDATE_" debut de l'etude"
 
 I '($D(@%VNI(%VNGA,3)@("K"))) G CMON
 I '(@%VNI(%VNGA,3)@("K")) G CMON
 S %VNG(5)=$$DEJAFAIT^%ATNSTCK(%VNE(%VNGA,1),%VNGA) G:%VNG(5)="" CMON
 
 S %VNI(%VNGA,4)=%VNI(%VNGA,4)+1
 S ^[QUI]RQSDON("RESATN","R",%VNE(%VNGA,2),"D",%VNI(%VNGA,4))=$$DATE^%QMDATE_" "_$$HEURE^%QMDATE_" deja etudie ("_%VNG(5)_") : recuperation des resultats"
 D GETRES^%ATNSTCK(%VNG(5),%VNGA)
 G FIN2
CMON 
 
 I %VNE(%VNGA,3) S %VNI(%VNGA,11)=$$INIAFF^%ATNEXE3
 
 S %VNI(%VNGA,7)=%VNE(%VNGA,7)
 
 
 
 S %VNI(%VNGA,1)=0,%VNG(6)=""
 S %VNI(%VNGA,2)=$$TEMP^%SGUTIL,@%VNI(%VNGA,2)=0
 D SET^%SGVAR("ETAT",$$VALEX^%ATNEXE3(%VNI(%VNGA,1)))
 
 I %VNE(%VNGA,3) D AFF^%QULELV(%VNI(%VNGA,11))
 
 
ETSUIV S @%VNI(%VNGA,2)=@%VNI(%VNGA,2)+1
 S @%VNI(%VNGA,2)@(@%VNI(%VNGA,2),"E")=%VNI(%VNGA,1)
 I WHOIS("ETUDE")'=0,WHOIS("MOTEUR")="HEVEA" D AVANTI^%QXPETU(WHOIS("ETUDE")),JOURN^%QXPETU($$VALEX^%ATNEXE3(%VNI(%VNGA,1)))
 D CLEAR^%SYSUTI1
 
 
 
 S tt=$S(@%VNI(%VNGA,2)>1:@%VNI(%VNGA,2)@(@%VNI(%VNGA,2)-1,"E"),1:"")
 I %VNI(%VNGA,12)'="",$D(^%RQSGLO("MOTEUR",%VNI(%VNGA,12),"UCONT.ETAT")) D @(^%RQSGLO("MOTEUR",%VNI(%VNGA,12),"UCONT.ETAT")_"(%VNE(%VNGA,1),%VNI(%VNGA,1),tt)")
 
 
 I %VNE(%VNGA,3) D ELEM^%QULELV(%VNI(%VNGA,11),%VNI(%VNGA,1),%VNG(6))
 I %VNI(%VNGA,7)=0 S %LIEU="ETAT" G MEN
 I $$ISCTRLA^%SYSCLAV S DX=1,DY=21 X XY I $$CONFIRM^%VZEOUI($$^%QZCHW("Retour au menu")_" ?")=1 S %LIEU="ETAT",%VNI(%VNGA,7)=0 G MEN
 
 G ETAT^%ATNEXE2
FINAC S %VNI(%VNGA,7)=%VNI(%VNGA,7)-1
 
 
 D COPY2^%QCAGLC("W",$E(%VNI(%VNGA,2),1,$L(%VNI(%VNGA,2))-1)_","_@%VNI(%VNGA,2)_",""W"")")
 
 
 
 I $D(@%VNI(%VNGA,3)@("O",%VNI(%VNGA,1)))#10,@%VNI(%VNGA,3)@("O",%VNI(%VNGA,1)) S %VNS(%VNGA,1)=1 G FIN
 
 
NEXTRA S %VNI(%VNGA,10)=""
NX2 S %VNI(%VNGA,10)=$ZP(@%VNI(%VNGA,3)@("R",%VNI(%VNGA,1),%VNI(%VNGA,10)))
 G:%VNI(%VNGA,10)="" RECUSE
 S %VNI(%VNGA,6)=""
NX22 S %VNI(%VNGA,6)=$O(@%VNI(%VNGA,3)@("R",%VNI(%VNGA,1),%VNI(%VNGA,10),%VNI(%VNGA,6)))
 G:%VNI(%VNGA,6)="" NX2
 
 I $D(@%VNI(%VNGA,2)@(@%VNI(%VNGA,2),"T",%VNI(%VNGA,6))) G NX22
 
 
 
 I %VNI(%VNGA,7)=0 S %LIEU="TRANSITION" G MEN
 I $$ISCTRLA^%SYSCLAV S DX=1,DY=21 X XY I $$CONFIRM^%VZEOUI($$^%QZCHW("Retour au menu")_" ?")=1 S %LIEU="TRANSITION",%VNI(%VNGA,7)=0 G MEN
 G TRANSIT^%ATNEXE2
NOKTRA S %VNI(%VNGA,7)=%VNI(%VNGA,7)-1
 S @%VNI(%VNGA,2)@(@%VNI(%VNGA,2),"T",%VNI(%VNGA,6))=1
 G NX22
 
OKTRA S %VNI(%VNGA,7)=%VNI(%VNGA,7)-1
 S @%VNI(%VNGA,2)@(@%VNI(%VNGA,2),"T",%VNI(%VNGA,6))=1
 
 
 D JOURNAL^%ATNEXE3("passage de l'etat "_$$VALEX^%ATNEXE3(%VNI(%VNGA,1))_" a l'etat "_$$VALEX^%ATNEXE3(%VNI(%VNGA,6)))
 D DEP^%SGVAR("ETAT")
 D SET^%SGVAR("ETAT",$$VALEX^%ATNEXE3(%VNI(%VNGA,6)))
 S %VNG(6)=%VNI(%VNGA,1),%VNI(%VNGA,1)=%VNI(%VNGA,6)
 G ETSUIV
 
FIN 
 
FIN2 D STOCK^%ATNSTCK(%VNE(%VNGA,2),%VNGA,%VNE(%VNGA,1))
 S ^[QUI]RQSDON("RESATN","R",%VNE(%VNGA,2),"C",3)=$H
FIN3 I %VNE(%VNGA,3) D END^%QULELV(%VNI(%VNGA,11))
 D JOURNAL^%ATNEXE3("fin de l'etude")
 D:$$SUPETU^%ATNEXE3(%VNE(%VNGA,1)) SUPETU^%ATNMN(%VNE(%VNGA,2))
 S %VNS(%VNGA,7)=%VNI(%VNGA,7)
 K %VNI(%VNGA)
 D DEP^%SGVAR("ETAT")
 G:%VNGA=1 RETEXTER
 G RETGOA^%ATNEXE2
 
 
RECUSE 
 
 
 
 
 K @%VNI(%VNGA,2)@(@%VNI(%VNGA,2)) S @%VNI(%VNGA,2)=@%VNI(%VNGA,2)-1
 
 D COPY^%QCAGLC($E(%VNI(%VNGA,2),1,$L(%VNI(%VNGA,2))-1)_","_@%VNI(%VNGA,2)_",""W"")","W")
 
 I @%VNI(%VNGA,2)=0 S %VNS(%VNGA,1)=0 G FIN
 S %VNI(%VNGA,1)=@%VNI(%VNGA,2)@(@%VNI(%VNGA,2),"E")
 I %VNE(%VNGA,3) D ELEM^%QULELV(%VNI(%VNGA,11),%VNI(%VNGA,1),$S(@%VNI(%VNGA,2)=1:"",1:@%VNI(%VNGA,2)@(@%VNI(%VNGA,2)-1,"E")))
 D DEP^%SGVAR("ETAT"),SET^%SGVAR("ETAT",$$VALEX^%ATNEXE3(%VNI(%VNGA,1)))
 D JOURNAL^%ATNEXE3("recusation : retour a l'etat "_$$VALEX^%ATNEXE3(%VNI(%VNGA,1)))
 G NEXTRA
 
MEN I %LIEU="ETAT" S @%MN@(1,"COM")=$$^%QZCHW("Execution des actions de ")_$$VALEX^%ATNEXE3(%VNI(%VNGA,1))
 I %LIEU="TRANSITION" S @%MN@(1,"COM")=$$^%QZCHW("Tester la transition de ")_$$VALEX^%ATNEXE3(%VNI(%VNGA,1))_" vers "_$$VALEX^%ATNEXE3(%VNI(%VNGA,6))
 I %LIEU="FINAC" S @%MN@(1,"COM")=$$^%QZCHW("Tester les transitions de ")_$$VALEX^%ATNEXE3(%VNI(%VNGA,1))
 S DX=1,DY=20 X XY D CLEBAS^%VVIDEO
 D ^%VQUIKMN(0,80,21,%MN,.ADRES,.CONTR) G:ADRES'="" @ADRES
 G MEN
 
LANCER S %VNI(%VNGA,7)=0 G AVPAS
 
PAS S %VNI(%VNGA,7)=1 G AVPAS
 
NBPAS S %VNI(%VNGA,7)=$$GETNBPAS^%ATNEXE3
 
AVPAS G:%LIEU="ETAT" ETAT^%ATNEXE2 G:%LIEU="TRANSITION" TRANSIT^%ATNEXE2
 I %LIEU="FINAC" S %VNI(%VNGA,7)=%VNI(%VNGA,7)-1 G NEXTRA
 
DOC G:'($D(@%VNI(%VNGA,3)@("DOC",%VNI(%VNGA,1)))) MEN
 S %VNG(8)=@%VNI(%VNGA,3)@("DOC",%VNI(%VNGA,1))
 D AFF^%QSNOTE2(2,5,70,10,$P(%VNG(8),"^"),$P(%VNG(8),"^",2),$P(%VNG(8),"^",3),$P(%VNG(8),"^",4),$P(%VNG(8),"^",5),$P(%VNG(8),"^",1),$P(%VNG(8),"^",2),"")
 I %VNE(%VNGA,3) D AFF^%QULELV(%VNI(%VNGA,11))
 G MEN
 
ABAND G FIN3
 
AUTRE1 S NUMUC=1 G AUTRE
AUTRE2 S NUMUC=2 G AUTRE
AUTRE3 S NUMUC=3 G AUTRE
AUTRE4 S NUMUC=4 G AUTRE
AUTRE5 S NUMUC=5 G AUTRE
AUTRE6 S NUMUC=6 G AUTRE
AUTRE S REAFF=0
 D UCONT^%ATNUT2(%VNE(%VNGA,1),NUMUC)
 I REAFF D:%VNE(%VNGA,3) AFF^%QULELV(%VNI(%VNGA,11))
 G MEN
 
INICAR 
 
 S %VNI(%VNGA,3)=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""ATN"")",%VNE(%VNGA,1))
 
 S %VNI(%VNGA,12)=$S($D(@%VNI(%VNGA,3)@("MOTEUR")):@%VNI(%VNGA,3)@("MOTEUR"),1:"HEVEA")
 Q
 ;

