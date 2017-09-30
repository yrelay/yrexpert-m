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

;%TXR009^INT^1^59547,74033^0
%TXR009 ;
 
 
 
 
 N DIA,DIAF,GL,JEU,NAT,NUM,NUM2,PR,PRN,RS,RV
 D DEB^%VTEMPS($P($ZPOS,"^",2))
 S PR="",GL="^PR",DIA="^[QUI]TLDIAL",DIAF="^[QUI]TLDIALF"
BIMPR S PR=$O(@GL@(PR))
 I PR="" D AFF^%VTEMPS($P($ZPOS,"^",2)) Q
 I '($D(@GL@(PR))) K @GL@(PR),@GL@(PR,"TITRE")
 S NAT=@GL@(PR) W !,!,PR,?10,NAT
 I NAT=0 K @GL@(PR),@GL@(PR,"TITRE") G BIMPR
 S RS="TITRE",RV=@GL@(PR,"TITRE")
 F NUM=1:1:10 S RS=RS_"^"_$S(NUM>NAT:"",1:@GL@(PR,NUM,1)),RV=RV_"^"_$S(NUM>NAT:"",1:@GL@(PR,NUM,4))
 
 
 S PRN=$$GETLBLAN^%VTLBLAN(PR)
 S @DIA@(PRN,1,"N")=RS,@DIAF@(PRN,1,"N","NORMAL")=RV
 W !,?20,RS,!,?20,RV
 G:(NUM+1)'<NAT JEU
 S RS="",RV=""
 F NUM2=NUM+1:1:NUM+11 S RS=RS_$S(NUM2>NAT:"",1:@GL@(PR,NUM2,1))_"^",RV=RV_$S(NUM2>NAT:"",1:@GL@(PR,NUM2,4))_"^"
 S @DIA@(PRN,2,"N")=RS,@DIAF@(PRN,2,"N","NORMAL")=RV
 W !,?30,RS,!,?30,RV
JEU 
 S JEU="" F NUM=0:0 S:JEU'="" @DIAF@(PRN,1,"N",JEU)=RV S JEU=$O(@GL@(PR,"JEU",JEU)) Q:JEU=""  S RV=@GL@(PR,"TITRE")_"^" F NUM2=1:1 Q:'($D(@GL@(PR,"JEU",JEU,NUM2)))  S RV=RV_@GL@(PR,"JEU",JEU,NUM2)_"^"
 G BIMPR

