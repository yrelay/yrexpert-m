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

;%QMKATB2^INT^1^59547,73878^0
PTCRETAB ;
 
 K ^SIN,^COS,^ARCSIN,^ARCCOS,^TANG,^COTG,^ARCTG,^ARCCTG,^PRECSTCT
 F ANGLE=1E-2:90:360 S %X=ANGLE D ^SINUS S:$E(%XX,1)="+" %XX=$P(%XX,"+",2) D TRAIT3
 F ANGLE=8999E-2:90:360 S %X=ANGLE D ^SINUS S:$E(%XX,1)="+" %XX=$P(%XX,"+",2) D TRAIT4
 F ANGLE=0:5E-1:90 S %X=ANGLE D ^SINUS S:$E(%XX,1)="+" %XX=$P(%XX,"+",2) S %XX=%XX*1 D TRAIT
 S ^SIN(360)=0,^COS(360)=1,FIN1=0,(SIN,COS,ASN,ACO)="" F I=1:1 D TRAIT5 Q:FIN=1
 S ANGLE=-1 F I=1:1 S ANGLE=$N(^SIN(ANGLE)) Q:ANGLE=-1  D TRAIT1 S OANGLE=ANGLE,OTG=TG,OCTG=CTG
 Q
TRAIT S (^SIN(ANGLE),^SIN(180-ANGLE),^COS(90-ANGLE),^COS((-90+ANGLE)#360))=%XX,(^SIN((-(ANGLE))#360),^SIN(180+ANGLE),^COS(90+ANGLE),^COS((-90-ANGLE)#360))=-(%XX),^ARCSIN(%XX)=ANGLE,^ARCSIN(-(%XX))=-(ANGLE),^ARCCOS(%XX)=90-ANGLE,^ARCCOS(-(%XX))=90+ANGLE
 W "*" Q
TRAIT1 I (ANGLE#180)=0 S TG=0,CTG="1??" G TRAIT2
 I (ANGLE=90)!(ANGLE=270) S TG="1??",CTG=0 G TRAIT2
 S TG=^SIN(ANGLE)/^COS(ANGLE),TG=TG*1,CTG=1/TG
TRAIT2 S ^TANG(ANGLE)=TG,^COTG(ANGLE)=CTG,^ARCTG(TG)=ANGLE,^ARCCTG(CTG)=ANGLE
 S ^PRECSTCT("TANG",ANGLE)=$S(TG="1??":ANGLE,1:OANGLE),^PRECSTCT("COTG",ANGLE)=$S(CTG="1??":ANGLE,1:OANGLE),^PRECSTCT("ARCTG",TG)=$S(TG="1??":0,1:OTG),^PRECSTCT("ARCTG",CTG)=$S(CTG="1??":90,1:OCTG)
 W "/" Q
TRAIT3 S %XX=%XX*1,^SIN(ANGLE)=%XX,^COS((ANGLE-90)#360)=%XX
 S:ANGLE=1E-2 ^ARCSIN(%XX)=ANGLE,^ARCCOS(%XX)=8999E-2 S:ANGLE=9001E-2 ^ARCSIN(%XX)=ANGLE S:ANGLE=27001E-2 ^ARCCOS(%XX)=-1E-2
 W "|" Q
TRAIT4 S %XX=%XX*1,^SIN(ANGLE)=%XX
 S:ANGLE=8999E-2 ^ARCSIN(%XX)=ANGLE,^ARCCOS(%XX)=1E-2 S:ANGLE=17999E-2 ^ARCSIN(%XX)=ANGLE S:ANGLE=35999E-2 ^ARCCOS(%XX)=-8999E-2
 W "\" Q
TRAIT5 S OSIN=SIN,OCOS=COS,OASN=ASN,OACO=ACO
 S SIN=$O(^SIN(SIN)),COS=$O(^COS(COS)),ASN=$O(^ARCSIN(ASN)),ACO=$O(^ARCCOS(ACO)),FIN=0
 I I=1 S SIN1=SIN,COS1=COS,ASN1=ASN,ACO1=ACO
 I SIN="" S SIN=SIN1,COS=COS1,FIN=1
 I ASN="" S ASN=ASN1,ACO=ACO1,^PRECSTCT("ARCSIN",ASN)=OASN,^PRECSTCT("ARCCOS",ACO)=OACO,FIN1=1
 S ^PRECSTCT("SIN",SIN)=OSIN,^PRECSTCT("COS",COS)=OCOS
 I FIN1'=1 S ^PRECSTCT("ARCSIN",ASN)=OASN,^PRECSTCT("ARCCOS",ACO)=OACO
 W "$" Q

