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
;! HL002 ! HL     ! 31/01/07 ! Open file                                      !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%UTSTCS^INT^1^59547,74033^0
%UTSTCS ;;05:04 PM  29 Dec 1995
 
 
 	Q
 N FILE,DEV,I,%I,WH,LIGNE,%WH,G
 S FILE="DEFUSER.YXP",DEV=10,G="^%INCONNE"
 ;HL002 O DEV:(MODE="W":FILE=FILE)
 O FILE:(newversion:block=2048:record=2044:exception="G ERROPEN"):0
 S I="" F %I=0:0 S I=$O(@G@("INCA1",I)) Q:I=""  U DEV W I,!,@G@("INCA1",I),!
 U DEV W !
 S I="" F %I=0:0 S I=$O(@G@("INCA3",I)) Q:I=""  U DEV W I,!,@G@("INCA3",I),!
 U DEV W !
 S WH="" F %WH=0:0 S WH=$O(@G@("CNX",WH)) Q:WH=""  D SV2
 U DEV W !
 C DEV
 Q

 ;HL002
ERROPEN
 I $P($ZS,",",1)=2 D  Q
 . W !,"Le fichier ",FILE," n'existe pas. [RETURN]" R *TMP
 I $P($ZS,",",1)=13 D  Q
 . W !,"Le fichier ",FILE," n'est pas accessible. [RETURN]" R *TMP
 ;HL002 ZM +$ZS
 Q

SV2 U DEV W WH,!
 F I=0:1 Q:'($D(@G@("CNX",WH,I)))  S LIGNE=@G@("CNX",WH,I) U DEV W LIGNE,!
 U DEV W !
 Q
 
 
LOAD N DEV,G,%I,V,I,WH,LIGNE,FILE
 S FILE="DEFUSER.YXP",G="^INCONNE",DEV=10
 ;HL002 O DEV:(MODE="r":FILE=FILE)
 O FILE:(readonly:block=2048:record=2044:exception="G ERROPEN"):0
 F %I=0:0 U DEV R I Q:I=""  U DEV R V S @G@("INCA1",I)=V
 F %I=0:0 U DEV R I Q:I=""  U DEV R V S @G@("INCA3",I)=V
NXWH U DEV R WH I WH="" C DEV Q
 F %I=0:1 U DEV R LIGNE Q:LIGNE=""  S @G@("CNX",WH,%I)=LIGNE F I=1:3 S MD=$P(LIGNE,"^",I) Q:MD=""  S @G@("CNY",WH,"LK",MD,"R")=$P(LIGNE,"^",I+1),@G@("CNY",WH,"LK",MD,"U")=$P(LIGNE,"^",I+2)
 G NXWH
 
 
 
BUG N WH,%WH,%I
 S WH="" F %WH=0:0 S WH=$O(^INCONNE("CNX",WH)) Q:WH=""  D BUG2
 Q
BUG2 F %I=0:1 Q:'($D(^INCONNE("CNX",WH,"LK",%I)))  S ^INCONNE("CNX",WH,%I)=^INCONNE("CNX",WH,"LK",%I)
 K ^INCONNE("CNX",WH,"LK")
 Q

