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

;%QMDREDI^INT^1^59547,73877^0
QMDREDI ;
 G DEBUT
CREE 
 K ^PAGE($J)
 D CADRE,JOURS
FIN Q
CADRE F X=0,2,27,52,77 D LV
 F Y=0,2,10 D LH
 S T=$P($T(MOIS),";;",2) F I=0,1,2 S M=$P(T,",",%M+I)_" "_$S((%M+I)>12:%A+1,1:%A),X=(13+(I*25))-($L(M)\2),Y=1 D W(M)
 S X=1,Y=3 F J="L","M","M","J","V","S","D" D W(J) S Y=Y+1
 Q
LH F X=0:1:77 S ^PAGE($J,Y,X)="-"
 Q
LV F Y=1:1:10 S ^PAGE($J,Y,X)="|"
 Q
MOIS ;;Janvier,Fevrier,Mars,Avril,Mai,Juin,Juillet,Aout,Septembre,Octobre,Novembre,Decembre,Janvier,Fevrier
JOURS K MOIS F U=0,1,2 S M=%M+U S:M>12 M=M-12 S MOIS(M)=""
 S X=4,(X,XM)=4
 S J="01/"_$J("0",2-$L(%M))_%M_"/"_%A D JDH^%QMDRSEJ(J,.P,.H,.Q) S Y=(H#7)-1 S:Y<3 Y=Y+7 D DAT^%QMDRSEJ(H,.DAT) S CM=$P(DAT,"/",2)
LOOP S CAR=$S($D(^[QUI]PLPLACAL(%RGME,H)):" ",1:"*") D W(CAR_$P(DAT,"/",1))
 S H=H+1 D DAT^%QMDRSEJ(H,.DAT) S CM1=$P(DAT,"/",2) G FINJ:'($D(MOIS(CM1+0)))
 S Y=Y+1 S:Y>9 Y=Y-7,X=X+4 S:CM1'=CM CM=CM1,(X,XM)=XM+25
 G LOOP
FINJ Q
W(MSG) 
 F Q=1:1:$L(MSG) S ^PAGE($J,Y,(X+Q)-1)=$E(MSG,Q)
 Q
TEST S %M=1,%A=89,%RGME="STANDARD" D ^%VZEATT,CREE
 D CLEPAG^%VVIDEO F DY=0:1:11 F DX=0:1:78 X XY W $S($D(^PAGE($J,DY,DX)):^PAGE($J,DY,DX),1:" ")
 Q
DEBUT D CLEPAG^%VVIDEO S SCR="QMDREDI" F U=1:1:^%SCRE(SCR) S RESUL(U)="",PATOUCH(U)="",DEJALU(U)=""
 S DEV=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
GET S CMS=0,NOMTAB=" " D ^%VAFIGRI,^%VAFISCR,^%VMODISC G:ABENDSCR FINI S V=1 F U="%RGME","%A" S @U=RESUL(V),V=V+1
 S %M=1
ECR O $I D ^%VZEATT,CREE S DX=0,DY=9 D CLEBAS^%VVIDEO F DY=9:1:19 X XY S Y=DY-9 F X=0:1:78 S CAR=$S($D(^PAGE($J,Y,X)):^PAGE($J,Y,X),1:" ") D:CAR="*" BLD^%VVIDEO W CAR D:CAR="*" NORM^%VVIDEO
ECR1 O $I D POCLEPA^%VVIDEO W "[RETURN], ou CTRLJ pour impression." R *BID G ASSEZ:BID=1 G:BID=10 PRINT S %M=%M+3 G:%M>12 ASSEZ G ECR
FINI K ^PAGE($J) Q
ASSEZ S RESUL(1)=%RGME,RESUL(2)=%A G GET
PRINT D POCLEPA^%VVIDEO,BLK^%VVIDEO W "Impression en cours..." D NORM^%VVIDEO
 O DEV U DEV W:%M=1 #,!,"Regime calendaire : ",%RGME W ! F Y=0:1:11 W ! F X=0:1:78 S CAR=$S($D(^PAGE($J,Y,X)):^PAGE($J,Y,X),1:" ") W CAR
 C DEV G ECR1
 ;

