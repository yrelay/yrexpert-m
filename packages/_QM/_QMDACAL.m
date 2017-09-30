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

;%QMDACAL^INT^1^59547,73877^0
PLEDCAL ;;08:27 AM  20 Apr 1989
 
 
 
 
 
 
 
 
 G DEBUT
CREE 
 K ^PAGE($J)
 D CADRE,JOURS,SEMAINE
FIN Q
SEMAINE 
 S TOP=%M+2,SEM="",STOP=0
 F I=%M:1:TOP Q:STOP  S SUIV="" F II=1:1 S SUIV=$O(^SEMAINE(%A,I,SUIV)) D:SUIV="" AFF D:I=13 ANNPLUS S:STOP SEM=SEM2_SEM Q:(SUIV="")!STOP  D AFFECT
 S I=5,P=1 K ^PAGE($J,11) D PREPA S ^PAGE($J,11,0)="S",^PAGE($J,11,1)="E",^PAGE($J,11,2)="M",^PAGE($J,11,27)="|",^PAGE($J,11,52)="|" Q
PREPA Q:I>76
 S TOP=I+1,NB=$P(SEM,"^",P),P=P+1,X=1
 F II=I:1:TOP S ^PAGE($J,11,II)=$E(NB,X),X=X+1
 S I=$S(I=25:I+5,I=50:I+5,1:I+4) G PREPA
AFF S:II<7 SEM=SEM_"  ^" Q
ANNPLUS 
 S SEM2=SEM,SEM="",SEM2=$E(SEM2,1,$L(SEM2)-3),SA=%A D ^%QMDATE2(%A+1)
 S %A=SA,PA=%A+1,STOP=1 F I=1:1:2 S SUIV="" F II=1:1 S SUIV=$O(^SEMAINE(PA,I,SUIV)) S:(SUIV="")&(II<7) SEM=SEM_"  ^" Q:SUIV=""  D AFFECT
 Q
AFFECT S SUI=$S($L(SUIV)=1:"0"_SUIV,1:SUIV)
 I (I=1)&((SUI=52)!(SUI=53)) S SEM=SUI_"^"_SEM Q
 S SEM=SEM_SUI_"^" Q
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
 S J="01/"_$J("0",2-$L(%M))_%M_"/"_%A D JDH^%QMDAK2(J,.P,.H,.Q) S Y=(H#7)-1 S:Y<3 Y=Y+7 D DAT^%QMDAK2(H,.DAT) S CM=$P(DAT,"/",2)
LOOP S CAR=" " D W(CAR_$P(DAT,"/",1))
 S H=H+1 D DAT^%QMDAK2(H,.DAT) S CM1=$P(DAT,"/",2) G FINJ:'($D(MOIS(CM1+0)))
 S Y=Y+1 S:Y>9 Y=Y-7,X=X+4 S:CM1'=CM CM=CM1,(X,XM)=XM+25
 G LOOP
FINJ Q
W(MSG) 
 F Q=1:1:$L(MSG) S ^PAGE($J,Y,(X+Q)-1)=$E(MSG,Q)
 Q
 
TEST S %M=11,%A=87,%RGME="STANDARD" D ^%VZEATT,CREE
 D CLEPAG^%VVIDEO F DY=0:1:11 F DX=0:1:78 X XY W $S($D(^PAGE($J,DY,DX)):^PAGE($J,DY,DX),1:" ")
 Q
 
DEBUT D CLEPAG^%VVIDEO,^%VZCDB("C A L E N D R I E R",0) W !,!
DEB S DX=2,DY=2,BLK=$J(" ",50) X XY W BLK S DX=2,DY=2 X XY S %A=$$^%VZAME1("Annee :") G:%A="" FINAL2 G:'($$ADR^%QZNBN1(%A)) DEB G:$L(%A)>2 DEB S %AA=%A,%RGME=""
 S DEV=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
GET W !
GE S DX=2,DY=3,BLK=$J(" ",50) X XY W BLK S DX=2,DY=3 X XY S %M=$$^%VZAME1("A partir du mois :") G:%M="" FINAL G:'($$ADR^%QZNBN1(%M)) GE G:$L(%M)>2 GE
 D MSG^%VZEATT("Construction des semaines..."),^%QMDATE2(%A)
ECR O $I Q:%M>12
 D MSG^%VZEATT("Construction du calendrier..."),CREE S DX=0,DY=9 D CLEBAS^%VVIDEO
 F DY=9:1:20 X XY S Y=DY-9 F X=0:1:78 S CAR=$S($D(^PAGE($J,Y,X)):^PAGE($J,Y,X),1:" ") D:CAR="*" BLD^%VVIDEO W CAR D:CAR="*" NORM^%VVIDEO
ECR1 O $I D POCLEPA^%VVIDEO W "[RETURN], ou CTRLJ pour impression"
 R *BID D TOUCHE^%INCCLAV(BID,.BID) G ASSEZ:BID=1 G:BID=10 PRINT
 S %M=%M+3 G ECR
ASSEZ G DEBUT
PRINT D MSG^%VZEATT("Impression en cours...")
 O DEV U DEV W ! F Y=0:1:11 W ! F X=0:1:78 S CAR=$S($D(^PAGE($J,Y,X)):^PAGE($J,Y,X),1:" ") W CAR
 C DEV G ECR1
FINAL K ^SEMAINE(%AA)
FINAL2 K ^PAGE($J)
 Q

