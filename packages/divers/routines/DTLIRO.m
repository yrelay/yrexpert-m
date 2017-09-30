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

;DTLIRO^INT^1^59547,74866^0
%ZRECURO ;
 
 K ^ERREUR($J),^UTILITY($J) S %NBERR=0 W !,"Reception de global d'un autre ordinateur ",!,! D ^%IS C IO O IO:(0:1) U IO:(0:"IS":$C(13)) W *-1 U 0:("":"B") W *-1
 F I=1:1:10 U IO:(0:"IS":$C(13)) R REP:30 G:REP["OK ?" BEG
ABORT S STOP=1 U 0:("":"B") W !,"Rien recu" C IO Q
BEG U IO:(0:"IS":$C(13)) W *-1,"OK !",$C(13)
SUITE S CPT=0
SUIT F I=1:1:5 R REP:3 U 0 W !,"J'ai lu : ",REP G T1:REP["OK ?",FIN:REP="FIN" U IO
 U IO:(0:"IS":$C(13)) W "BIS",$C(13) G SUIT,T1
T1 U IO:(0:"IS":$C(13)) W *-1,"OK !",$C(13) R %T:15,%RS:15 U 0:("":"B") W !,?10,"Recu ",%T,"=",%RS
VERIF U IO:(0:"IS":$C(13)) S %LT=$L(%T),%LRS=$L(%RS) W %LT,$C(13),%LRS,$C(13)
 F I=1:1:5 U IO:(0:"IS":$C(13)) R REP:3 U 0 W !,"Pour 2eme accord : ",REP G OK:REP["OK !",NOK:REP["nok"
NOK U IO W "BIS",$C(13) G SUIT
OK W !,"Affecte : ",%T,"=",%RS S %RO=$P(%T,"""",2) W !,%RO I '($D(^UTILITY($J,%RO))) S ^UTILITY($J,%RO)=1 X "ZR  ZS @%RO"
 S $ZT="ERR",@%T=%RS U IO:(0:"IS":$C(13)) W "SUITE",$C(13) G SUITE
FIN C IO W !,"Fin reception" Q
ERR U 0:("":"B") W *7,!,"*** ERREUR ***",! S %NBERR=%NBERR+1,^ERREUR($J,%NBERR)=$ZE_"|"_%T_"|"_%RS U IO:(0:"IS":$C(13)) W *-1,"BIS",$C(13) G:$ZE["INTERRU" FIN G SUITE

