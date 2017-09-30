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

;%ATNETUS^INT^1^59547,73866^0
%ATNETUS ;;10:14 AM  16 Nov 1992; ; 02 Dec 92  8:51 AM
 
 
SAIS(DEF) 
 N RES,ATN,MODE
 D CLEPAG^%VVIDEO
 W !,"NOM DE L'ATN A EVALUER " R ATN
 W !,"MODE VISIBLE (0/1) " R MODE
 Q ATN_$C(0)_MODE
 
 
SUITINI(NUMET) 
 N %VNGA,%VNI,%VNE,%VNG,GLOCAR
 S %VNGA=1
 S %VNE(%VNGA,2)=NUMET
 S %VNE(%VNGA,3)=$$GLOCAR^%ATNETU(NUMET)
 S %VNE(%VNGA,4)=$$GLOEXEC^%ATNETU(NUMET)
 S %VNE(%VNGA,1)=@%VNE(%VNGA,3)@("ATN")
 S %VNG(%VNGA)=@%VNE(%VNGA,3)@("MODE")
 K ^PARAENT($J)
 I $D(^[QUI]RQSGLO("ATN",%VNE(1,1),"E"))#10 D @^[QUI]RQSGLO("ATN",%VNE(1,1),"E")
 D COPY^%QCAGLC("^PARAENT("_$J_")",$$CONCAS^%QZCHAD(%VNE(%VNGA,3),"PARAENT"))
 D SAVVAR(NUMET)
 D SETETAT^%ATNETU(NUMET,1)
 K ^PARAENT($J)
 Q
SAVVAR(NUMET) 
 N NOMVAR,GLOCAR
 S GLOCAR=$$GLOCAR^%ATNETU(NUMET)
 F NOMVAR="%VNI","%VNGA","%VNE","%VNG" I $D(@NOMVAR)>0 D COPY2^%QCAGLC(NOMVAR,$$CONCAS^%QZCHAD(GLOCAR,NOMVAR))
 Q
 
RESVAR(NUMET) 
 N NOMVAR,GLOCAR
 S GLOCAR=$$GLOCAR^%ATNETU(NUMET)
 F NOMVAR="%VNI","%VNGA","%VNE","%VNG" D COPY2^%QCAGLC($$CONCAS^%QZCHAD(GLOCAR,NOMVAR),NOMVAR)
 Q
 
ACTIET(NUMET) 
 N %VNGA,%VNI,%VNE,%VNG
 N %MN
 D RESVAR(NUMET)
 D COPY^%QCAGLC($$CONCAS^%QZCHAD(%VNE(%VNGA,3),"PARAENT"),"^PARAENT("_$J_")")
 S %MN=$$TEMP^%SGUTIL
 S @%MN="21^10^79"
 S @%MN@(1)=$$^%QZCHW("Lancer execution")_"^LANCER"
 S @%MN@(1,"COM")=$$^%QZCHW("Lancer l'execution depuis le noeud actuel")
 S @%MN@(2)=$$^%QZCHW("Pas suivant")_"^PAS"
 S @%MN@(3)="Fin"_"^ARRET"
 S @%MN@(3,"COM")="Fin"
 
 I $$GETETAT^%ATNETU(NUMET)<2 G START
 
 
 I %VNG(1) D AFF^%QULELV(%VNI(%VNGA,11))
 S %LIEU=$S($$GETETAT^%ATNETU(NUMET)=3:"ETAT",1:"TRANSITION")
 G MEN
 
 
 G START
RETEXTER 
 I $D(^[QUI]RQSGLO("ATN",%VNE(1,1),"S"))#10 D @^[QUI]RQSGLO("ATN",%VNE(1,1),"S")
 Q
 
 
 
 
 
 
 
 
 
START 
 S %EXEC=0
 
 
 K ^PARASOR($J,%VNGA),%VNI(%VNGA)
 
 
 D INITREM^%ATNREM(%VNE(%VNGA,1))
 
 
 
 
 S %VNI(%VNGA,3)=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""ATN"")",%VNE(%VNGA,1))
 
 S %VNI(%VNGA,4)=1
 
 
 
 
 
 
 
CMON 
 
 G:'(%VNG(1)) APRAFF
 S %VNG(4)=$$TEMP^%SGUTIL
 S @%VNG(4)@("FULL")="$$FULL^%ATNETUS"
 S %VNI(%VNGA,11)=$$CONCAS^%QZCHAD(%VNE(%VNGA,4),"VISU")
 D INIT2^%QULELV2(%VNI(%VNGA,11),$$CONCAS^%QZCHAD(%VNI(%VNGA,3),"T"),$$CONCAS^%QZCHAD(%VNI(%VNGA,3),"T"),3,3,%VNG(4),"1"_$C(0)_"20"_$C(0)_"atn "_%VNE(%VNGA,1),0,1)
 K @(%VNG(4))
 
APRAFF 
 
 
 
 S %VNI(%VNGA,1)=0,%VNG(6)=""
 S %VNI(%VNGA,2)=$$CONCAS^%QZCHAD(%VNE(%VNGA,4),"PILE")
 S @%VNI(%VNGA,2)=0
 
 I %VNG(1) D AFF^%QULELV(%VNI(%VNGA,11))
 
 
ETSUIV S @%VNI(%VNGA,2)=@%VNI(%VNGA,2)+1
 S @%VNI(%VNGA,2)@(@%VNI(%VNGA,2),"E")=%VNI(%VNGA,1)
 
 I %VNG(1) D ELEM^%QULELV(%VNI(%VNGA,11),%VNI(%VNGA,1),%VNG(6))
 I %EXEC=0 S %LIEU="ETAT" G MEN
 
 G ETAT^%ATNETU2
FINAC 
 
 D COPY2^%QCAGLC("W",$E(%VNI(%VNGA,2),1,$L(%VNI(%VNGA,2))-1)_","_@%VNI(%VNGA,2)_",""W"")")
 
 I $D(@%VNI(%VNGA,3)@("O",%VNI(%VNGA,1)))#10,@%VNI(%VNGA,3)@("O",%VNI(%VNGA,1)) G FIN
 
NEXTRA S %VNI(%VNGA,10)=""
NX2 S %VNI(%VNGA,10)=$ZP(@%VNI(%VNGA,3)@("R",%VNI(%VNGA,1),%VNI(%VNGA,10)))
 G:%VNI(%VNGA,10)="" RECUSE
 S %VNI(%VNGA,6)=""
NX22 S %VNI(%VNGA,6)=$O(@%VNI(%VNGA,3)@("R",%VNI(%VNGA,1),%VNI(%VNGA,10),%VNI(%VNGA,6)))
 G:%VNI(%VNGA,6)="" NX2
 
 I $D(@%VNI(%VNGA,2)@(@%VNI(%VNGA,2),"T",%VNI(%VNGA,6))) G NX22
 
 
 
 I %EXEC=0 S %LIEU="TRANSITION" G MEN
 G TRANSIT^%ATNETU2
NOKTRA S @%VNI(%VNGA,2)@(@%VNI(%VNGA,2),"T",%VNI(%VNGA,6))=1
 G NX22
 
OKTRA S @%VNI(%VNGA,2)@(@%VNI(%VNGA,2),"T",%VNI(%VNGA,6))=1
 
 
 S %VNG(6)=%VNI(%VNGA,1),%VNI(%VNGA,1)=%VNI(%VNGA,6)
 G ETSUIV
 
FIN 
 
FIN2 
 
 I %VNG(1) D END^%QULELV(%VNI(%VNGA,11))
 K %VNI(%VNGA)
 G:%VNGA=1 RETEXTER
 
 
 
RECUSE 
 
 
 
 
 K @%VNI(%VNGA,2)@(@%VNI(%VNGA,2)) S @%VNI(%VNGA,2)=@%VNI(%VNGA,2)-1
 
 D COPY^%QCAGLC($E(%VNI(%VNGA,2),1,$L(%VNI(%VNGA,2))-1)_","_@%VNI(%VNGA,2)_",""W"")","W")
 G:@%VNI(%VNGA,2)=0 FIN
 S %VNI(%VNGA,1)=@%VNI(%VNGA,2)@(@%VNI(%VNGA,2),"E")
 I %VNG(1) D ELEM^%QULELV(%VNI(%VNGA,11),%VNI(%VNGA,1),$S(@%VNI(%VNGA,2)=1:"",1:@%VNI(%VNGA,2)@(@%VNI(%VNGA,2)-1,"E")))
 G NEXTRA
 
MEN 
 I %LIEU="ETAT" S @%MN@(2,"COM")=$$^%QZCHW("Execution des actions de ")_%VNI(%VNGA,1)
 I %LIEU="TRANSITION" S @%MN@(2,"COM")=$$^%QZCHW("Tester la transition de ")_%VNI(%VNGA,1)_" vers "_%VNI(%VNGA,6)
 D ^%VQUIKMN(0,80,22,%MN,.ADRES,.CONTR) G @ADRES
LANCER S %EXEC=1 G:%LIEU="ETAT" ETAT^%ATNETU2 G:%LIEU="TRANSITION" TRANSIT^%ATNETU2
PAS S %EXEC=0 G:%LIEU="ETAT" ETAT^%ATNETU2 G:%LIEU="TRANSITION" TRANSIT^%ATNETU2
 
ARRET D SAVVAR(NUMET)
 D SETETAT^%ATNETU(NUMET,$S(%LIEU="ETAT":3,1:4))
 Q
 
 
 
FULL(TP) 
 N ND
 S ND=@TP@("O") I '($D(@%VNI(%VNGA,3)@("TITRE",ND))) Q ND
 S ND=@%VNI(%VNGA,3)@("TITRE",ND) Q ND

