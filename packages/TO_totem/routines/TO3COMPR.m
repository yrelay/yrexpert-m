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

;TO3COMPR^INT^1^59547,74870^0
TO3COMPR ;
 
 I $D(^TABIDENT(WHOIS,"INTERDIT","COMP",$I)) S INT=$$^%QZCHW(" C O M P R E H E N S I O N ") D ^TONOEXEC Q
 S ^VERIF($I)=0,TIT=$$^%QZCHW("Analyse du savoir-faire") D ^TOGETART
SUITE K ^EXLIST($I),^COMPILVU($I) G:'($D(^TACOMPIL($I))) END D CLEPAG^%VVIDEO S DX=10,DY=4 X XY S %NARTI=-1 F UU=1:1 S %NARTI=$N(^TACOMPIL($I,%NARTI)) Q:%NARTI=-1  S DY=DY+1 X XY W ^TACOMPIL($I,%NARTI)
QUES3 D POCLEPA^%VVIDEO W $$^%QZCHW(" OK pour la comprehension de ces articles (O/N) ? ") R *REP S REP=$C(REP) G:(REP'=$$^%QZCHW("O"))&(REP'="N") QUES3 G:REP="N" END
BEG S %NARTI=-1 F AA=0:0 S %NARTI=$N(^TACOMPIL($I,%NARTI)) Q:%NARTI=-1  S %ARTI=^TACOMPIL($I,%NARTI) D TRAIT,SUP,MKLIATT(%ARTI)
 D CURRENT^%IS D:^VERIF($I)'=1 QUES^TORESPAR G END
TRAIT W !,%ARTI
 I '(DTM) K (%PROGEX,%ZD,%ARTI,MCM,COUNT,FF,MA,PIM,PIMEN,QUI,WHOIS,%NARTI,AA,ARTI,DX,DY,IOP,IO,XY,TACOMPIL,SUB) G TRAIT1
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="%PROGEX","%ZD","%ARTI","MCM","COUNT","FF","MA","PIM","PIMEN","QUI","WHOIS","%NARTI","AA","ARTI","DX","DY","IOP","IO","XY","TACOMPIL","SUB","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
TRAIT1 D VARSYS^%QCSAP,ZD^%QMDATE4
 S ARTI=%ARTI D ^TO3CPTIE
FIN Q
END K ^EXLIST($I)
 Q
LEX S PARA=Y1 D ^%QZCHBT S PCH=$S($E(PARA,$L(PARA))="*":$E(PARA,1,$L(PARA)-1),1:PARA) D ^%LXABR
 Q
SUP 
 S NODEVI=-1,YA=%ARTI,KTB="^[QUI]ANTETUDE(YA,NODEVI)"
 Q:'($D(^[QUI]ANTETUDE(YA)))
 F %VW=1:1 S NODEVI=$N(^[QUI]ANTETUDE(YA,NODEVI)) Q:NODEVI=-1  I $D(^[QUI]TREEWORK(NODEVI)) S TWREF=$N(^[QUI]TREEWORK(NODEVI,-1)) W !,$$^%QZCHW("Suppression de ")_NODEVI D DEL^TODELDEV
 K KTB,YA
 Q
 
 
MKLIATT(ARTI) 
 N EXP,%EXP,GLO,NMLI,%NX,NX
 S GLO=$$TEMP^%SGUTIL
 S NMLI="EXPLICITES.TOTEM/"_ARTI
 S %I=0
 S EXP="" F %EXP=1:1 S EXP=$O(^[QUI]EXPLICI(ARTI,EXP)) Q:EXP=""  S NX="" F %NX=0:0 S NX=$O(^[QUI]EXPLICI(ARTI,EXP,NX)) Q:NX=""  S %I=%I+1,@GLO@(%I)=NX
 I $$EX^%QMLILA(NMLI) D DEL^%QMLILA(NMLI)
 D ADD^%QMLILA(NMLI,GLO)
 K @(GLO)

