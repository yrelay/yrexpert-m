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

;TRBEST^INT^1^59547,74877^0
TRBEST ;
 K ^B1 F J=1:1:N S ^B1($I,J)=^B($I,J)-^EPS($I,J)
FAIS F I=1:1:M F J=1:1:N G:^X($I,I,J)<0 NFS1
 F I=1:1:M G:^U($I,I)>0 NFS2 D SOMLI G:SOMLI>^C($I,I) NFS4
 F J=1:1:N G:^V($I,J)<0 NFS3 D SOMCJ G:SOMCJ<^B1($I,J) NFS5
 G OPT
SOMLI S SOMLI=0 F J=1:1:N S SOMLI=SOMLI+^X($I,I,J)
 Q
SOMCJ S SOMCJ=0 F I=1:1:M S SOMCJ=SOMCJ+^X($I,I,J)
 Q
NFS1 W *7,*7,!,"solution non realisable: ^X($I,I,J) < 0",! G OPT
NFS2 W *7,*7,!,"solution non realisable: ^U($I,I) > 0",! G OPT
NFS3 W *7,*7,!,"solution non realisable: ^V($I,J) < 0",! G OPT
NFS4 W *7,*7,!,"solution non realisable: SOM LIGNE I > ^C($I,I)",! G OPT
NFS5 W *7,*7,!,J,"solution non realisable: SOM COLONNE J < ^B($I,J)",! G OPT
 
OPT S PRIMAL=0 F I=1:1:M F J=1:1:N S PRIMAL=PRIMAL+(^X($I,I,J)*^A($I,I,J))
 S DUAL=0 F I=1:1:M S DUAL=DUAL+(^U($I,I)*^C($I,I))
 F J=1:1:N S DUAL=DUAL+(^V($I,J)*^B1($I,J))
 I DUAL=PRIMAL W "*" Q
 W *7,*7,!,"solution non optimale",! R *XB
 Q

