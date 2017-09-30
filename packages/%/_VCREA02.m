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

;%VCREA02^INT^1^59547,74034^0
GECREA02 ;; 22 Jan 87 11:06 AM ; 04 Jan 88  2:55 PM
 
CHAR K DEF,LIBEL,CHAR
 F %U=0:1 S LI=$P($T(LIB+%U),";;",2) Q:LI=""  S IT=$P(LI,"#",1),IT1=$P(IT,"/",1),IT2=$P(IT,"/",2),LIBEL(IT1)=IT2,CHAR(IT2)=$S(($D(^%SCRE(M,IT2))#10)=1:^%SCRE(M,IT2),1:""),DEF(IT2)=$P(LI,"#",2)
 S IT2="RELATION",NU=1,RL=-1 F %U=1:1 S RL=$N(^%SCRE(M,IT2,RL)) Q:RL=-1  S CHAR("RELATION."_NU)=RL_","_^%SCRE(M,IT2,RL),LIBEL("Relation."_NU)="RELATION."_NU,DEF("RELATION."_NU)="Grille,chp lien no 1,chp lien no 2...",NU=NU+1
 F NU=NU:1:7 S CHAR("RELATION."_NU)="",LIBEL("Relation."_NU)="RELATION."_NU,DEF("RELATION."_NU)="Grille,chp lien no 1,chp lien no 2..."
 D ^%VCREA05 F I="POLICE","POSITION","MERE","ROUSTOC","ROUINI","ROUMOD","ROUDUP","ROUSUP","GLOSTOC","OPTIONS" S:CHAR(I)'="" ^%SCRE(M,I)=CHAR(I) K:CHAR(I)="" ^%SCRE(M,I)
 S:'($D(^%SCRE(M,"GLOSTOC"))) ^%SCRE(M,"GLOSTOC")="^[QUI]"_M
 K ^%SCRE(M,"RELATION") F NU=1:1 S RL="RELATION."_NU Q:'($D(CHAR(RL)))  S:CHAR(RL)'="" REL=$P(CHAR(RL),",",1),^%SCRE(M,"RELATION",REL)=$P(CHAR(RL),",",2,999)
 D CLEPAG^%VVIDEO Q
LIB ;;Global de stockage/GLOSTOC#Donner le nom du global de stockage des donnees ex:^[QUI]TOTO
 ;;Routine de stockage/ROUSTOC#Donner la sequence de stockage des donnees ex:^STOCX,^%VAUTSTO
 ;;Routine d'initialisation/ROUINI#Donner la sequence d'initialisation des donnees 
 ;;Grille mere/MERE#Donner la grille mere de la grille courante ainsi que les numeros des champs herites ex:FINTITRE,1,2
 ;;Fonction de supression/ROUSUP#Donner la sequence de suppression (fonction) ex:^VERIF
 ;;Fonction de modification/ROUMOD
 ;;Fonction de duplication/ROUDUP
 ;;Police/POLICE#80,132
 ;;Position/POSITION#X gauche,Y haut,X droit,Y bas
 ;;Options/OPTIONS#Option bas de page sur saisie (LIB1:SCR1,LIB2:SCR2....)
 ;;
 ;;Relation

