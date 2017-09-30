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

;%VACTZIN^INT^1^59547,74033^0
%VACTZIN ;
 S ^TOZE("LIM")=300
 S $ZT="FIN",INT=WHOIS D STAND^%VTOZE S:^TABIDENT(WHOIS,"IMPRCOUR")<30 ^TABIDENT(WHOIS,"IMPRCOUR")=60
 D IMPR^%QAX
LP G:$T(@INT)="" STAG1 S LI=$P($T(@INT),";;",2) G:LI="" FIN I LI["IDEM" S INT=$P(LI,":",2) G LP
 F %U=0:1 S LI=$P($T(@INT+%U),";;",2) Q:LI=""  Q:LI="*"  S TB=$P(LI,"/",1),LI=$P(LI,"/",2) F %V=1:1 S %M=$P(LI,";",%V) Q:%M=""  S %M1=$P(%M,":",1),%M2=$P(%M,":",2),@TB@(%M1)=%M2
STAG1 
 G FIN
 
STAG Q
 S:($D(^TD("STAGE"))#10)'=1 ^TD("STAGE")=90 I '($D(^TD("STAGE",WH))) S ^TD("STAGE",WH)=$P($H,",",1)_"^"_%DAT Q
 I WH=WHOIS S H1=$P(^TD("STAGE",WH),"^",1),H2=$P($H,",",1),H3=H2-H1 I H3'<^TD("STAGE") H
 Q
FIN K INT,H1,H2,H3,LI,%U,%V,TB,%M,%M1,%M2 Q
 
TABID ;;PASS/WHOIS/,BACK/GENERAL,START/GENERAL,PASS/TOT,PRINTER/$I/,IMPRCOUR/60,SITE/$I/,TABTRA/0,TYPTAB/0,ECRGRA/0,TYPECR/VT200,ENTETE/XXXXXXXX,NOM/WHOIS/,MACHINE/%DIR/,
 D INT^%DIR S INT=$P($T(TABID),";;",2) F %U=1:1 S LI=$P(INT,",",%U) Q:LI=""  S WH=$P(LI,"/",1),%M=$P(LI,"/",2),LI=$P(LI,"/",3) D:'($D(^TABIDENT(WHOIS,WH))) TABIDA
 Q
TABIDA I LI="@" S @("^TABIDENT(WHOIS,WH)="_%M) Q
 S ^TABIDENT(WHOIS,WH)=%M
 Q
MCL ;;^TD(WHOIS)/SYSTEME:1;FABRICATION:1;TOP0DRIM:1;GAMSTAND:1;MODIFICATION D'UNE ETUDE:1;PASSERELLE TOTEM:1
 ;;^TOZE($I)/GRAPH:1;PHASE:0;MATIERE:0;MACHINE:0
 ;;*
TIT ;;IDEM:MCL
 ;;*
STAGE ;;SMR,SMT,CMP,VOO,DMO,PLAT

