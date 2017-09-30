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

;%TXPVRF2^INT^1^59547,74033^0
%TXPVRF2(ETUDE) ;;08:49 AM  29 Mar 1993; ; 25 May 93  3:05 PM
 
 
 
 N TEMP,MENG,FILE
 
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"E"),MENG=$$CONCAS^%QZCHAD(TEMP,"MG")
 S ARTICLE="" D INIVAR^%TXPETU
 
 S TYPE=0,ATELIER="",ARTICLE="",NOVALIB=0,%VALATEL=0
 S %ATELIER="" F %A=0:0 S %ATELIER=$O(@etuatg@(%ATELIER)) Q:%ATELIER=""  S ATELIER=%ATELIER,ATT="" D EV2
 D DEPOUIL^%TXPETU(ETUDE)
 Q
EV2 
EV2A 
 D ACTIV
 Q
ACTIV 
 
 N KEEPATT
 S KEEPATT=ATELIER
 U 0
 
 
 U 0
 F %iiii=2 S DEB=$H D EXEC S VALEUR(%iiii)=VALEUR,FIN=$H,DUR(%iiii)=(($P(FIN,",")-$P(DEB,","))*86400)+($P(FIN,",",2)-$P(DEB,",",2))
 U 0
 
 S VALEUR(1)="",DUR(1)=""
 
 U SOR2 W !,?1,ETUDE,?13,ATELIER,?23,$J(VALEUR(1),"",3),?40,$J(VALEUR(2),"",3),?57,$S(VALEUR(1)=VALEUR(2):"",1:"????"),?63,DUR(1),?70,DUR(2)
 U 0
 Q
EXEC 
 S ^TXPMODE($J)=%iiii
 S ATELIER=KEEPATT
 D NETTOIE^%TXPETU(ETUDE)
 S PMAX=$S($D(@etu@("Nombre de Periodes")):@etu@("Nombre de Periodes"),1:"")
 D ATELIER^%TXPARB(ETUDE)
 D VALATE^%TXPSUTI(ETUDE,ATELIER)
 D VALETU^%TXPSUTI(ETUDE)
 D NETTOIE^%TXPETU(ETUDE)
 S VALEUR=@etuat@("Valeur Atelier")
 S ATELIER=KEEPATT
FINATEL Q
 
TESTSTD 
 
 S SOR=0
 S SOR2=10 O 10:(FILE="txpvrf5.vrf":MODE="w")
 U SOR2 W $$DATE^%QMDATE_" a "_$$HEURE^%QMDATE,!
 U SOR2 W !," "
 U SOR2 W !," sur BALbatre ",!
 U SOR2 W !,?1,"etude",?13,"atelier",?23,"%TXP1R",?40,"%TXP1RD",?63,"1R",?70,"1RD",!,!
 
 S rrr="TXP93030" F iiii=458:1:701 D ^%TXPVRF2(rrr_iiii)
 
 C 10
 Q
 
 
CONT 
 
 S rrr="TXP93030" F iiii=402:1:701 S ETUDE=rrr_iiii,ATELIER="" F %A=0:0 S ATELIER=$O(@etuatg@(ATELIER)) Q:ATELIER=""  S CONTRAINTE="" F  S CONTRAINTE=$O(@etuatcg@(CONTRAINTE)) Q:CONTRAINTE=""  S @etuatc@("Etat de cette contrainte")="Active"
 Q
 
 
MESU 
 S SOR=0,SOR2=0
 S rrr="TXP93030" F iiii=402 D ^%TXPVRF2(rrr_iiii)
 Q
 ;
 ;
 ;

