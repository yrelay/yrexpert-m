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

;%AMGVIS^INT^1^59547,73865^0
%AMGVIS ;;05:46 PM  10 Aug 1993; ; 13 Mar 93  4:14 PM
 
 
 
VISU(ETUDE) 
 N JRN,U,A,B,RAC,STRU,PERE,RESUL,NOUVET
 
 S (NOUVET,JRN)=ETUDE
 S RESUL=$$TEMP^%SGUTIL
 S PERE=$S($D(@DEFETU@("pere")):$P(@DEFETU@("pere"),"^"),1:"")
 S U=$$TEMP^%SGUTIL,RAC=$$TEMP^%SGUTIL
 F %A=0:0 Q:'($D(@DEFETU@("pere")))  S JRN=$P(@DEFETU@("pere"),"^")
 S @RAC@(JRN)=""
 S U=$$TEMP^%SGUTIL
 D INIGLOUC
 S TITRE="1"_$C(0)_"5"_$C(0)_"positionement de l'etude courante ("_ETUDE_")"_$C(0)_"2"_$C(0)_"5"_$C(0)_"dans le graphe des etudes"
 S STRU=$$INIT^%QULELV(GRAPHETU,RAC,12,3,U,TITRE,0,1)
 
 
 D RUN^%QULELV1(STRU,ETUDE,PERE,0,1,RESUL)
 S NUMUC=@RESUL@("NUMUC")
 I NUMUC=1 S NOUVET=@RESUL@("O")
 D END^%QULELV(STRU)
 K @(U)
 Q NOUVET
ACCES(TP) 
 N ETU
 S ETU=@TP@("O")
 D JRN^%AMGA1(ETU)
 S MODG=0
 Q
 
 
ABRV(L,LG) S V=@L Q $E(V,6,$L(V))
 
 
FULL(TP) 
 N GAG,VAL S GAG=@TP@("O")
 Q GAG_"  (type "_TYPE_" valeur "_VAL_")"
 
INFO(TP) 
 Q 1_$C(0)_1_$C(0)_"etude "_$S($D(^[QUI]DEFETU(@TP@("O"),"MOTEUR")):^[QUI]DEFETU(@TP@("O"),"MOTEUR"),1:"")_$C(0)_2_$C(0)_1_$C(0)_$S($D(^[QUI]DEFETU(@TP@("O"),"CAR1")):^[QUI]DEFETU(@TP@("O"),"CAR1"),1:"")
 
 
 
INIGLOUC 
 S @U@("AUTRE",1)="CHANGER^%AMGVIS",@U@("AUTRE",1,"TXT")="changer",@U@("AUTRE",1,"COM")="changer d'etude",@U@("AUTRE",1,"CTR")="B",@U@("AUTRE",1,"NUMUC")=1
 S @U@("AUTRE",2)="FIN^%AMGVIS",@U@("AUTRE",2,"TXT")="fin",@U@("AUTRE",2,"COM")="retourner a l'explication",@U@("AUTRE",2,"CTR")="A",@U@("AUTRE",2,"NUMUC")=2
 
 
 
 S @U@("INFO")="$$INFO^%AMGVIS"
 Q
 
 
CHANGER(TP) 
 S FINEXE=1
 Q
FIN(TP) S FINEXE=1 Q

